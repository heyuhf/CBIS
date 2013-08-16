package cbis

import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

class ShopController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [shopInstanceList: Shop.list(params), shopInstanceTotal: Shop.count()]
    }

    def create() {
        [shopInstance: new Shop(params)]
    }
    
    
    def save() {
        
        def file=request.getFile('shopLogo')
        if(!file.empty){
            def fileName=file.getOriginalFilename()
            def timeFormat=new SimpleDateFormat("yyyyMMddHHmmss")
            def time=timeFormat.format(new Date())
            def random=new Random()
            def rand=random.nextInt(1000)
            def filetype=fileName.substring(fileName.indexOf(".")+1)
            def filepath=new File("web-app/uploads/shopLogo/${time}${rand}.${filetype}")
            filepath.mkdirs()
            params.shopLogoUrl="uploads/shopLogo/${time}${rand}.${filetype}"
            file.transferTo(filepath)
        }
        def user=User.findByUserName(session.userName)
        if(!user){
            render("请重新登录！")
        }
        //def user=new User(userName:'user',password:'123456',email:'user@cbis.com',phone:'1234567')
        
        def shopInstance = new Shop(shopName:params.shopName,address:params.address,user:user,description:params.description,shopLogoUrl:params.shopLogoUrl)
        if (!shopInstance.save(flush: true)) {
            render("保存失败"+params.shopName+params.address+params.description+params.shopLogoUrl)
            return
        }
        def shoptagnames=params.shoptags.split(",|，")
        shoptagnames.each{
            def  shopTagInstance=ShopTag.findByTagName(it)
            if(!shopTagInstance){
                shopTagInstance=new ShopTag(tagName:it)
                if (!shopTagInstance.save(flush: true)) {
                        response.sendError(405)
                        return
                }
            }
            shopInstance.addToShopTags(shopTagInstance)
        }

        flash.message = "店铺创建成功！"
        flash.shopname=shopInstance.shopName
        redirect(action:"success",id:shopInstance.id)
        
    }
    /*原备份
    def save() {
        def shopInstance = new Shop(params)
        if (!shopInstance.save(flush: true)) {
            render(view: "create", model: [shopInstance: shopInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'shop.label', default: 'Shop'), shopInstance.id])
        redirect(action: "show", id: shopInstance.id)
    }*/

    def show(Long id) {
        def shopInstance = Shop.get(id)
        if (!shopInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shop.label', default: 'Shop'), id])
            redirect(action: "list")
            return
        }
        
        

        [shopInstance: shopInstance]
    }

    def edit(Long id) {
        def shopInstance = Shop.get(id)
        if(shopInstance.user.userName!=session.userName){
            flash.message="您不能编辑不属于自己的店铺"
            redirect(controller:"user",action:"frame_shop")
            return
        }
        if (!shopInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shop.label', default: 'Shop'), id])
            redirect(action: "list")
            return
        }

        [shopInstance: shopInstance]
    }

    def update(Long id, Long version) {
        def shopInstance = Shop.get(id)
        if (!shopInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shop.label', default: 'Shop'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (shopInstance.version > version) {
                shopInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'shop.label', default: 'Shop')] as Object[],
                          "Another user has updated this Shop while you were editing")
                render(view: "edit", model: [shopInstance: shopInstance])
                return
            }
        }

        shopInstance.properties = params

        if (!shopInstance.save(flush: true)) {
            render(view: "edit", model: [shopInstance: shopInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'shop.label', default: 'Shop'), shopInstance.id])
        redirect(action: "show", id: shopInstance.id)
    }

    def delete(Long id) {
        def shopInstance = Shop.get(id)
        if (!shopInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shop.label', default: 'Shop'), id])
            redirect(action: "list")
            return
        }

        try {
            shopInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'shop.label', default: 'Shop'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shop.label', default: 'Shop'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def success(Long id){
        def shopInstance=Shop.get(id)
        [shopInstance:shopInstance]
    }
    
}
