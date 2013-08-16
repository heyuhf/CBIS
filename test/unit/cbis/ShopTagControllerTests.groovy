package cbis



import org.junit.*
import grails.test.mixin.*

@TestFor(ShopTagController)
@Mock(ShopTag)
class ShopTagControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/shopTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.shopTagInstanceList.size() == 0
        assert model.shopTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.shopTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.shopTagInstance != null
        assert view == '/shopTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/shopTag/show/1'
        assert controller.flash.message != null
        assert ShopTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/shopTag/list'

        populateValidParams(params)
        def shopTag = new ShopTag(params)

        assert shopTag.save() != null

        params.id = shopTag.id

        def model = controller.show()

        assert model.shopTagInstance == shopTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/shopTag/list'

        populateValidParams(params)
        def shopTag = new ShopTag(params)

        assert shopTag.save() != null

        params.id = shopTag.id

        def model = controller.edit()

        assert model.shopTagInstance == shopTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/shopTag/list'

        response.reset()

        populateValidParams(params)
        def shopTag = new ShopTag(params)

        assert shopTag.save() != null

        // test invalid parameters in update
        params.id = shopTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/shopTag/edit"
        assert model.shopTagInstance != null

        shopTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/shopTag/show/$shopTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        shopTag.clearErrors()

        populateValidParams(params)
        params.id = shopTag.id
        params.version = -1
        controller.update()

        assert view == "/shopTag/edit"
        assert model.shopTagInstance != null
        assert model.shopTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/shopTag/list'

        response.reset()

        populateValidParams(params)
        def shopTag = new ShopTag(params)

        assert shopTag.save() != null
        assert ShopTag.count() == 1

        params.id = shopTag.id

        controller.delete()

        assert ShopTag.count() == 0
        assert ShopTag.get(shopTag.id) == null
        assert response.redirectedUrl == '/shopTag/list'
    }
}
