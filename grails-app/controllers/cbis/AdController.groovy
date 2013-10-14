package cbis

import org.springframework.dao.DataIntegrityViolationException
import java.text.SimpleDateFormat

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
        def user=User.findByUserName(session.userName)
        if(!user){
            flash.message="您的登录已失效，请重新登录！"
            redirect(action:"login")
            return
        }
        params.user=user
        Date datetime=new Date()
        params.hasEnd="on"
        params.date=datetime
        Calendar calendar=Calendar.getInstance()
        calendar.setTime(datetime)
        println(params.limit_num)
        println(params.limit_unit)
        if(params.limit_unit=="1"){
            calendar.add(Calendar.DAY_OF_MONTH,Integer.parseInt(params.limit_num))
        }else if(params.limit_unit=="2"){
            calendar.add(Calendar.DAY_OF_MONTH,(Integer.parseInt(params.limit_num))*7)
        }else if(params.limit_unit=="3"){
            calendar.add(Calendar.MONTH, Integer.parseInt(params.limit_num))
        }else if(params.limit_unit=="4"){
            calendar.add(Calendar.YEAR, Integer.parseInt(params.limit_num))
        }else if(params.limit_unit=="5"){
            params.hasEnd=false
        }
        
        params.deadline=calendar.getTime()
        println(params.deadline)
        def adInstance = new Ad(params)
        if (!adInstance.save(flush: true)) {
            render(view: "create", model: [adInstance: adInstance])
            return
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }
    
    /*原备份
    def save() {
        def adInstance = new Ad(params)
        if (!adInstance.save(flush: true)) {
            render(view: "create", model: [adInstance: adInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }
    */
   
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
        
        
        def user=User.findByUserName(session.userName)
        if(!user){
            flash.message="您的登录已失效，请重新登录！"
            redirect(action:"login")
            return
        }
        def adInstance = Ad.get(id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "list")
            return
        }
        
        params.user=user
        params.hasEnd="on"
        Calendar calendar=Calendar.getInstance()
        calendar.setTime(adInstance.date)
        println(params.limit_unit)
        if(params.limit_unit=="1"){
            calendar.add(Calendar.DAY_OF_MONTH,Integer.parseInt(params.limit_num))
        }else if(params.limit_unit=="2"){
            calendar.add(Calendar.DAY_OF_MONTH,(Integer.parseInt(params.limit_num))*7)
        }else if(params.limit_unit=="3"){
            calendar.add(Calendar.MONTH, Integer.parseInt(params.limit_num))
        }else if(params.limit_unit=="4"){
            calendar.add(Calendar.YEAR, Integer.parseInt(params.limit_num))
        }else if(params.limit_unit=="5"){
            params.hasEnd=false
        }
        params.deadline=calendar.getTime()
        
        
        
        

        if (version != null) {
            if (adInstance.version > version) {
                adInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ad.label', default: 'Ad')] as Object[],
                          "Another user has updated this Ad while you were editing")
                render(view: "edit", model: [adInstance: adInstance])
                return
            }
        }

        adInstance.title = params.title
        adInstance.deadline=params.deadline
        adInstance.content=params.content

        if (!adInstance.save(flush: true)) {
            render(view: "edit", model: [adInstance: adInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }
/*
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
    */
    def deletead(Long id) {
        def adInstance = Ad.get(id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(action: "list")
            return
        }

        try {
            adInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            redirect(controller:"user",action: "frame_ads")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), id])
            render("error")
        }
    }
    
}
