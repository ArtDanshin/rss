require 'net/ldap'

module LdapAuthenticate
  def self.authenticate(login, pass)
    ldap = Net::LDAP.new
    ldap.host = 'ldcro.rambler.ramblermedia.com'
    ldap.port = 389
    ldap.auth ENV.fetch('LDAP_LOGIN', ''), ENV.fetch('LDAP_PASS', '')

    ldap.bind_as(
      base: 'ou=company,dc=rambler,dc=ramblermedia,dc=com',
      filter: "(&(objectcategory=person)(objectclass=user)(|(samaccountname=#{login})(mail=#{login})))",
      password: pass
    )
  end
end
