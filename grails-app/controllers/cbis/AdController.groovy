package cbis

import org.springframework.dao.DataIntegrityViolationException

class AdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [adInstanceList: Ad.list(params), adInstanceTotal: Ad.count()]
    }

    def create() {
        [adInstance: new Ad(params)]
    }

    def save() {
        def adInstance = new Ad(params)
        if (!adInstance.save(flush: true)) {
            render(view: "create", model: [adInstance: adInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }

    def show(Long id) {
        def adInstance = Ad.get(id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "list")
            return
        }

        [adInstance: adInstance]
    }

    def edit(Long id) {
        def adInstance = Ad.get(id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "list")
            return
        }

        [adInstance: adInstance]
    }

    def update(Long id, Long version) {
        def adInstance = Ad.get(id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (adInstance.version > version) {
                adInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ad.label', default: 'Ad')] as Object[],
                          "Another user has updated this Ad while you were editing")
                render(view: "edit", model: [adInstance: adInstance])
                return
            }
        }

        adInstance.properties = params

        if (!adInstance.save(flush: true)) {
            render(view: "edit", model: [adInstance: adInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }

    def delete(Long id) {
        def adInstance = Ad.get(id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "list")
            return
        }

        try {
            adInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "show", id: id)
        }
    }
}
