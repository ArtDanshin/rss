require 'net/ldap'

class LdapAuthenticate
  def authenticate(user, pass)
    ldap = Net::LDAP.new
    ldap.host = 'ldcro.rambler.ramblermedia.com'
    ldap.port = 389
    ldap.auth ENV.fetch('LDAP_LOGIN', ''), ENV.fetch('LDAP_PASS', '')

    res = ldap.bind_as(
      base: 'ou=company,dc=rambler,dc=ramblermedia,dc=com',
      filter: "(&(objectcategory=person)(objectclass=user)(|(samaccountname=#{user})(mail=#{user})))",
      password: pass
    )
  end
end
