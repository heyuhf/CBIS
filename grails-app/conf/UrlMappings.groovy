class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
                                controller(matches:/.*[^(services)].*/)
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
