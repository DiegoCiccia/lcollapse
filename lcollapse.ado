cap program drop lcollapse
program define lcollapse, rclass
version 12.0
syntax anything [, *]

qui {
    local TEMP "`anything'"
    local VARS ""
    while strpos("`TEMP'", "(") > 0 {
        local TEMP = substr("`TEMP'", strpos("`TEMP'","(")+1, .)
        if strpos("`TEMP'", "(") > 0 local ADD = substr("`TEMP'", strpos("`TEMP'", ")") + 1, strpos("`TEMP'", "(") - strpos("`TEMP'", ")") - 1)    
        else local ADD = substr("`TEMP'", strpos("`TEMP'", ")") + 1, .)
        local VARS "`VARS' `ADD'"
    }
    foreach v of varlist `VARS' {
        local l_`v': var label `v'
    }
}

collapse `anything', `options'

qui {
    foreach v of varlist `VARS' {
        label var `v' "`l_`v''"
    }
}
end
