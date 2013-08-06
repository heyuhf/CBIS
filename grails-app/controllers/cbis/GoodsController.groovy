package cbis

import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

class GoodsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [goodsInstanceList: Goods.list(params), goodsInstanceTotal: Goods.count()]
    }

    def create() {
        [goodsInstance: new Goods(params)]
    }
    
    def save() {
        
        def user=User.findByUserName(session.userName)
        def shop=Shop.get(params.shop.id)
        params.goodsPicUrls="ppp"
        if(!shop){
            render("shop 不存在")
        }
        
        def file=request.getFile('goodsPic')
        if(!file.empty){
            def fileName=file.getOriginalFilename()
            def timeFormat=new SimpleDateFormat("yyyyMMddHHmmss")
            def time=timeFormat.format(new Date())
            def random=new Random()
            def rand=random.nextInt(1000)
            def filetype=fileName.substring(fileName.indexOf(".")+1)
            def filepath=new File("web-app/uploads/goodsPic/${time}${rand}.${filetype}")
            filepath.mkdirs()
            params.goodsPicUrls="uploads/goodsPic/${time}${rand}.${filetype}"
            file.transferTo(filepath)
        }
        
        
        def goodsInstance = new Goods(goodsName:params.goodsName,description:params.description,price:params.price,onsalePrice:0,onsale:"false",goodsPicUrls:params.goodsPicUrls,user:user,shop:shop)
        if (!goodsInstance.save(flush: true)) {
            render("保存失败")
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'goods.label', default: 'Goods'), goodsInstance.id])
        render("保存成功:"+params.goodsName)
    }
    
    /*原始备份
    def save() {
        def goodsInstance = new Goods(params)
        if (!goodsInstance.save(flush: true)) {
            render(view: "create", model: [goodsInstance: goodsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'goods.label', default: 'Goods'), goodsInstance.id])
        redirect(action: "show", id: goodsInstance.id)
    }
    */
   
    def show(Long id) {
        def goodsInstance = Goods.get(id)
        if (!goodsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), id])
            redirect(action: "list")
            return
        }

        [goodsInstance: goodsInstance]
    }

    def edit(Long id) {
        def goodsInstance = Goods.get(id)
        if (!goodsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), id])
            redirect(action: "list")
            return
        }

        [goodsInstance: goodsInstance]
    }

    def update(Long id, Long version) {
        def goodsInstance = Goods.get(id)
        if (!goodsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (goodsInstance.version > version) {
                goodsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'goods.label', default: 'Goods')] as Object[],
                          "Another user has updated this Goods while you were editing")
                render(view: "edit", model: [goodsInstance: goodsInstance])
                return
            }
        }

        goodsInstance.properties = params

        if (!goodsInstance.save(flush: true)) {
            render(view: "edit", model: [goodsInstance: goodsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'goods.label', default: 'Goods'), goodsInstance.id])
        redirect(action: "show", id: goodsInstance.id)
    }

    def delete(Long id) {
        def goodsInstance = Goods.get(id)
        if (!goodsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), id])
            redirect(action: "list")
            return
        }

        try {
            goodsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'goods.label', default: 'Goods'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'goods.label', default: 'Goods'), id])
            redirect(action: "show", id: id)
        }
    }
}
