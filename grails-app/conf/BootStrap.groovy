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
            admin.save(flush: true)

            def roleAdmin = Role.findByAuthority("ROLE_ADMIN")
            def roleUser = Role.findByAuthority("ROLE_USER")
            if (!roleAdmin) {
                roleAdmin = new Role(authority: "ROLE_ADMIN").save(flush: true)
            }
            if (!roleUser){
                roleUser = new Role(authority: "ROLE_USER").save(flush: true)
            }
            PersonRole.create(admin, roleAdmin, true)
            PersonRole.create(admin, roleUser, true)
        }

    }
    def destroy = {
    }
}
