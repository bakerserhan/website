cd $HOME
echo 'Installing bundler...'
gem install bundler --no-rdoc --no-ri
echo ""
echo 'Installing rake...'
gem install rake --no-rdoc --no-ri
echo ""
echo 'Installing rack...'
gem install rack --no-rdoc --no-ri
rbenv rehash
echo ""
echo 'Creating website directories and files'
mkdir -p website/public/{images,js,css}
touch website/{config.ru,public/index.html}
echo ""
echo 'Redirecting you to the directory and generating Gemfile for ya'
cd website && bundle init
echo '<h1>Hi, World!</h1>' >> public/index.html
echo 'source :rubygems' >> Gemfilec
echo "gem 'rack'" >> Gemfile
echo ""
echo 'Boom. Done. Now installing dependencies'
echo "####################################################################"
bundle install
echo ""
echo 'OK, will set the configuration.'
echo 'use Rack::Static,' >> config.ru 
echo '  :urls => ["/images", "/js", "/css"],' >> config.ru 
echo '  :root => "public"' >> config.ru 
echo '' >> config.ru
echo 'run lambda { |env|' >> config.ru
echo '  [' >> config.ru
echo '    200, ' >> config.ru
echo '    {' >> config.ru
echo "      'Content-Type'  => 'text/html', " >> config.ru
echo "      'Cache-Control' => 'public, max-age=86400' " >> config.ru
echo '    },' >> config.ru 
echo "    File.open('public/index.html', File::RDONLY)" >> config.ru 
echo '  ]' >> config.ru 
echo '}' >> config.ru 
echo ""
echo 'Done! Will raise server and open initial website'
rackup &
sleep 3
open http://localhost:9292
