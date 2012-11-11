class rubygems::postgres {
    require ::postgres::devel
    rubygems::gem{'ruby-pg':}
}
