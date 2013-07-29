package cbis



import org.junit.*
import grails.test.mixin.*

@TestFor(Domain_UserController)
@Mock(Domain_User)
class Domain_UserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/domain_User/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.domain_UserInstanceList.size() == 0
        assert model.domain_UserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.domain_UserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.domain_UserInstance != null
        assert view == '/domain_User/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/domain_User/show/1'
        assert controller.flash.message != null
        assert Domain_User.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/domain_User/list'

        populateValidParams(params)
        def domain_User = new Domain_User(params)

        assert domain_User.save() != null

        params.id = domain_User.id

        def model = controller.show()

        assert model.domain_UserInstance == domain_User
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/domain_User/list'

        populateValidParams(params)
        def domain_User = new Domain_User(params)

        assert domain_User.save() != null

        params.id = domain_User.id

        def model = controller.edit()

        assert model.domain_UserInstance == domain_User
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/domain_User/list'

        response.reset()

        populateValidParams(params)
        def domain_User = new Domain_User(params)

        assert domain_User.save() != null

        // test invalid parameters in update
        params.id = domain_User.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/domain_User/edit"
        assert model.domain_UserInstance != null

        domain_User.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/domain_User/show/$domain_User.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        domain_User.clearErrors()

        populateValidParams(params)
        params.id = domain_User.id
        params.version = -1
        controller.update()

        assert view == "/domain_User/edit"
        assert model.domain_UserInstance != null
        assert model.domain_UserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/domain_User/list'

        response.reset()

        populateValidParams(params)
        def domain_User = new Domain_User(params)

        assert domain_User.save() != null
        assert Domain_User.count() == 1

        params.id = domain_User.id

        controller.delete()

        assert Domain_User.count() == 0
        assert Domain_User.get(domain_User.id) == null
        assert response.redirectedUrl == '/domain_User/list'
    }
}
