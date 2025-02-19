# -*- encoding: utf-8 -*-

# stub: net-scp 4.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "net-scp".freeze
  s.version = "4.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/net-ssh/net-scp/blob/master/CHANGES.txt" } if s.respond_to? :metadata=
  s.require_paths = [ "lib".freeze ]
  s.authors = [ "Jamis Buck".freeze, "Delano Mandelbaum".freeze, "Mikl\u00F3s Fazekas".freeze ]
  s.cert_chain = [ "-----BEGIN CERTIFICATE-----\nMIIDQDCCAiigAwIBAgIBATANBgkqhkiG9w0BAQsFADAlMSMwIQYDVQQDDBpuZXRz\nc2gvREM9c29sdXRpb3VzL0RDPWNvbTAeFw0yMjA3MjUxODEzNTJaFw0yMzA3MjUx\nODEzNTJaMCUxIzAhBgNVBAMMGm5ldHNzaC9EQz1zb2x1dGlvdXMvREM9Y29tMIIB\nIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxieE22fR/qmdPKUHyYTyUx2g\nwskLwrCkxay+Tvc97ZZUOwf85LDDDPqhQaTWLvRwnIOMgQE2nBPzwalVclK6a+pW\nx/18KDeZY15vm3Qn5p42b0wi9hUxOqPm3J2hdCLCcgtENgdX21nVzejn39WVqFJO\nlntgSDNW5+kCS8QaRsmIbzj17GKKkrsw39kiQw7FhWfJFeTjddzoZiWwc59KA/Bx\nfBbmDnsMLAtAtauMOxORrbx3EOY7sHku/kSrMg3FXFay7jc6BkbbUij+MjJ/k82l\n4o8o0YO4BAnya90xgEmgOG0LCCxRhuXQFnMDuDjK2XnUe0h4/6NCn94C+z9GsQID\nAQABo3sweTAJBgNVHRMEAjAAMAsGA1UdDwQEAwIEsDAdBgNVHQ4EFgQUBfKiwO2e\nM4NEiRrVG793qEPLYyMwHwYDVR0RBBgwFoEUbmV0c3NoQHNvbHV0aW91cy5jb20w\nHwYDVR0SBBgwFoEUbmV0c3NoQHNvbHV0aW91cy5jb20wDQYJKoZIhvcNAQELBQAD\nggEBADxmDQVPrCXVbQqdaRJvoEdD/4LDWqSq6huG4n4PvhNmi9sKRVNh4eJNwFx+\nVBX5PGeha0OL9tr5dlMLV7aCgty+3BTIg+Li8Ifc+TOUi+8nIHs6U4SZ4vFNs/bt\nWUe6k027p0PHXPl63c5qQXnc3fkap7TFZJpFNEB0LbwHeQ98t1Tr9BAi/aZPEHTX\n/JMWwrWBMOCPXCuZtvrRFRPgac7ElGu9r1rQWofdljxOPWwnjRdWc5jcgjq5/SAY\nJHNAmLO0TwBERFVJ/Y/uu1o4GsxWG+7tNq8eLJSrBqh+Ty9yIWuaJ2njNB8rCkS6\n1lmaMtrHdEPQAS75oTsrq4bfdOQ=\n-----END CERTIFICATE-----\n".freeze ]
  s.date = "2022-10-18"
  s.description = "A pure Ruby implementation of the SCP client protocol".freeze
  s.email = [ "net-ssh@solutious.com".freeze ]
  s.extra_rdoc_files = [ "LICENSE.txt".freeze, "README.rdoc".freeze ]
  s.files = [ "LICENSE.txt".freeze, "README.rdoc".freeze ]
  s.homepage = "https://github.com/net-ssh/net-scp".freeze
  s.licenses = [ "MIT".freeze ]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "A pure Ruby implementation of the SCP client protocol.".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 3

  s.add_runtime_dependency(%q(net-ssh).freeze, [ ">= 2.6.5".freeze, "< 8.0.0".freeze ])
  s.add_development_dependency(%q(test-unit).freeze, [ ">= 0".freeze ])
  s.add_development_dependency(%q(mocha).freeze, [ ">= 0".freeze ])
end
