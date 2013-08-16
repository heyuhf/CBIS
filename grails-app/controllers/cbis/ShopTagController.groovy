package cbis

import org.springframework.dao.DataIntegrityViolationException

class ShopTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [shopTagInstanceList: ShopTag.list(params), shopTagInstanceTotal: ShopTag.count()]
    }

    def create() {
        [shopTagInstance: new ShopTag(params)]
    }

    def save() {
        def shopTagInstance = new ShopTag(params)
        if (!shopTagInstance.save(flush: true)) {
            render(view: "create", model: [shopTagInstance: shopTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), shopTagInstance.id])
        redirect(action: "show", id: shopTagInstance.id)
    }

    def show(Long id) {
        def shopTagInstance = ShopTag.get(id)
        if (!shopTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), id])
            redirect(action: "list")
            return
        }

        [shopTagInstance: shopTagInstance]
    }

    def edit(Long id) {
        def shopTagInstance = ShopTag.get(id)
        if (!shopTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), id])
            redirect(action: "list")
            return
        }

        [shopTagInstance: shopTagInstance]
    }

    def update(Long id, Long version) {
        def shopTagInstance = ShopTag.get(id)
        if (!shopTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (shopTagInstance.version > version) {
                shopTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'shopTag.label', default: 'ShopTag')] as Object[],
                          "Another user has updated this ShopTag while you were editing")
                render(view: "edit", model: [shopTagInstance: shopTagInstance])
                return
            }
        }

        shopTagInstance.properties = params

        if (!shopTagInstance.save(flush: true)) {
            render(view: "edit", model: [shopTagInstance: shopTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), shopTagInstance.id])
        redirect(action: "show", id: shopTagInstance.id)
    }

    def delete(Long id) {
        def shopTagInstance = ShopTag.get(id)
        if (!shopTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), id])
            redirect(action: "list")
            return
        }

        try {
            shopTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shopTag.label', default: 'ShopTag'), id])
            redirect(action: "show", id: id)
        }
    }
}
