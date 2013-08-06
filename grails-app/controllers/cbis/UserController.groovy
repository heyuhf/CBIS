package cbis

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def login(){
        
    }
    
    def frame_index(){
        def user=User.findByUserName(session.userName)
        def shoplist=Shop.findByUser(user)
        def goodslist=Goods.findByUser(user)
        if(!shoplist&&!goodslist){
            [shopTotal: 0,goodsTotal:0]
        }
        else if(!shoplist&&goodslist){
            [shopTotal: 0,goodsTotal:goodslist.count()]
        }
        else if(shoplist&&!goodslist){
            [shopTotal: shoplist.count(),goodsTotal: 0]
        }
        else{
            [shopTotal: shoplist.count(),goodsTotal:goodslist.count()]
        }
        
    }
    
    def frame_account(){
        
    }
    
    def frame_shop(Integer max){
        params.max = Math.min(max ?: 10, 100)
        [shopInstanceList: Shop.list(params), shopInstanceTotal: Shop.count()]
    }
    
    def frame_addshop(){
        [shopInstance: new Shop(params)]
    }
    
    def frame_addgoods(){
        def user=User.findByUserName(session.userName)
        def shop=Shop.findByUser(user)
        if(!shop){
            flash.message="您还没有创建店铺，请先创建店铺，再添加商品"
        }
        [shopInstance: new Goods(params)]
    }
    
    def frame_goods(Integer max){
        params.max = Math.min(max ?: 10, 100)
        [goodsInstanceList: Goods.list(params), goodsInstanceTotal: Goods.count()]
    }
    
    def frame_ads(Integer max){
        params.max = Math.min(max ?: 10, 100)
        [adInstanceList: Ad.list(params), adInstanceTotal: Ad.count()]
    }
    
    def frame_addad(){
        [adInstance: new Ad(params)]
    }
}
