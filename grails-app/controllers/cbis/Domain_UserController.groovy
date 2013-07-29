package cbis

import org.springframework.dao.DataIntegrityViolationException

class Domain_UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [domain_UserInstanceList: Domain_User.list(params), domain_UserInstanceTotal: Domain_User.count()]
    }

    def create() {
        [domain_UserInstance: new Domain_User(params)]
    }

    def save() {
        def domain_UserInstance = new Domain_User(params)
        if (!domain_UserInstance.save(flush: true)) {
            render(view: "create", model: [domain_UserInstance: domain_UserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), domain_UserInstance.id])
        redirect(action: "show", id: domain_UserInstance.id)
    }

    def show(Long id) {
        def domain_UserInstance = Domain_User.get(id)
        if (!domain_UserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), id])
            redirect(action: "list")
            return
        }

        [domain_UserInstance: domain_UserInstance]
    }

    def edit(Long id) {
        def domain_UserInstance = Domain_User.get(id)
        if (!domain_UserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), id])
            redirect(action: "list")
            return
        }

        [domain_UserInstance: domain_UserInstance]
    }

    def update(Long id, Long version) {
        def domain_UserInstance = Domain_User.get(id)
        if (!domain_UserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (domain_UserInstance.version > version) {
                domain_UserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'domain_User.label', default: 'Domain_User')] as Object[],
                          "Another user has updated this Domain_User while you were editing")
                render(view: "edit", model: [domain_UserInstance: domain_UserInstance])
                return
            }
        }

        domain_UserInstance.properties = params

        if (!domain_UserInstance.save(flush: true)) {
            render(view: "edit", model: [domain_UserInstance: domain_UserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), domain_UserInstance.id])
        redirect(action: "show", id: domain_UserInstance.id)
    }

    def delete(Long id) {
        def domain_UserInstance = Domain_User.get(id)
        if (!domain_UserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), id])
            redirect(action: "list")
            return
        }

        try {
            domain_UserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'domain_User.label', default: 'Domain_User'), id])
            redirect(action: "show", id: id)
        }
    }
}
