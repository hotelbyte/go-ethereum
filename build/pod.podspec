Pod::Spec.new do |spec|
  spec.name         = 'Ghbc'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/hotelbyte/go-hotelbyte'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS Hotelbyte Client'
  spec.source       = { :git => 'https://github.com/hotelbyte/go-hotelbyte.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/Ghbc.framework'

	spec.prepare_command = <<-CMD
    curl https://ghbcstore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/Ghbc.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end
