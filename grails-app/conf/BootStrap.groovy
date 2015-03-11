import com.headbangers.mordheim.security.Person
import com.headbangers.mordheim.security.PersonRole
import com.headbangers.mordheim.security.Role

class BootStrap {

    def init = { servletContext ->

        def admin = Person.findByUsername("cyril")
        if (!admin) {
            // Création de l'user admin
            admin = new Person()
            admin.accountExpired = false
            admin.accountLocked = false
            admin.email = "cyril.brouillard@gmail.com"
            admin.enabled = true
            admin.passwordExpired = false
            admin.username = "cyril"

            admin.password = "cyril"
            admin.token = UUID.randomUUID().toString();
            admin.save(flush: true)

            def roleAdmin = Role.findByAuthority("ROLE_ADMIN")
            def roleUser = Role.findByAuthority("ROLE_USER")
            if (!roleAdmin) {
                roleAdmin = new Role(authority: "ROLE_ADMIN").save(flush: true)
            }
            if (!roleUser) {
                roleUser = new Role(authority: "ROLE_USER").save(flush: true)
            }
            PersonRole.create(admin, roleAdmin, true)
            PersonRole.create(admin, roleUser, true)
        }

        /*def simpleUser = Person.findByUsername("toto")
        if (!simpleUser){
            // Création de l'user admin
            simpleUser = new Person()
            simpleUser.accountExpired = false
            simpleUser.accountLocked = false
            simpleUser.email = "toto@gmail.com"
            simpleUser.enabled = true
            simpleUser.passwordExpired = false
            simpleUser.username = "toto"

            simpleUser.password = "cyril"
            simpleUser.token = UUID.randomUUID().toString();
            simpleUser.save(flush: true)

            def roleUser = Role.findByAuthority("ROLE_USER")
            PersonRole.create(simpleUser, roleUser, true)
        }*/

    }
    def destroy = {
    }
}
