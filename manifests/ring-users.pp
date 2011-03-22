class ring_users {

##### BEGIN intouch #####

    add_user { intouch:
        email    => "tech@intouch.eu",
        uid      => 5001,
        groups  => ['ring-users']
    }
    add_ssh_key { intouch:
        user    => "intouch",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEAxr0qjSn+2nhibydQhc/Ry4KiChKv9OJBja69s0ScyNTwWhvWvEItgXQlbLp0RW5XeZ7aBvehHa3pYLPZUshhz5roRMhZHZhKe9Cu12ZSS7qIXk1DRL8vTDP2K9f+yyH04yDlIr2O9uyh/B3KCcK1TdGVDsj/KiXgDQSClfQnFdqByYqFftEnjAq86eoADhIWnEbH06HE2ndEtnggtOJcy0D7SC1O0Y3MxqpJy8oEHMsrVoFi+Do+bc6iqW39Yi20t92I/qKz08wHrOEqNSsL0OMi302GJ9ZozhJXHIUCdvMMgUlufI41lbhXpeq8Kau/eZAdgC3CcqE1nsL19mOSfw==",
        name    => "tt@intouch.eu",
        type    => "ssh-rsa"
    }

##### EINDE intouch ##### 

##### BEGIN bit #####

    add_user { bit:
        email    => "teun@teun.tv",
        uid      => 5002,
        groups   => ['ring-users']
    }
    add_ssh_key { bit:
        user    => "bit",
        key     => "AAAAB3NzaC1kc3MAAAEBALy1k8K73RbXIfmdwdPkK4/d5JzLoSDo2kst9vElxK2+2TfiEq2KipYGH1pYwlNsbNWwrjYDzdrIUK92D3h0AoalDySxdOWEA4n2CoLTOIV93+4mCoYkkxMMsD1S1TERSqbSX1m51h2L7O8bLz/8DjpLGzCAH19egMQR6Ca4JzTDKA3lJojAfQ+7rJEkq72oIMXCKBaHrnRaaf+nOuwIG1GPkcnBsCKC/g9L3yNZJuIoB+Wl1lP98iEz+RZDGT5MltVWosBxM2UcmMwiI2oznl/HKwTZbW85mhQzs9OVUib4cFzvS7vYa36khvD19/ZPnfXj2zzK3C2BTb6udBIor7MAAAAVAIDv35RBXwhkIGjxVr5jRUAl6z2pAAAA/zrkj7qv64bKnyDa398/xgEDWEw26vlw2QeJLTo11gJAG4cg0DFqSeJfbclJLPv5C+vSP7es5to8tZLkkmNXpZx1Fv1we+yBUJ6Z1QtZ4hd8rh4mx82Z4oGqh4w6kt1moCk8BAMKifC51diw6xZOgpU7zXmymgCLExhyb/UEL+EUVglnl/YEPqszd/8M7OD/FPMcnLFbh7MvVZJorJfNO0ZKITaZSFCzR9aiHfYyPfg+npxjQrCBLCDyoQ+GxidZPVX86pwUHmwg7tb9EtnFQIYSJLRlw3x5Fl7zSKxLUt6ODieSpkSQAdDY6Y9rf5tk0NahY3vGfTWAxTZrDjdJiQAAAQBurz0Bq43YoAMPRh0aQ54jIEYE9dOdXo4Q9kH4ARaKMiE1cGaytLfeAJcomYsnjn5O26Q8R2JByBU7sSCzVFKZtGpQJWfksO3fY9XLu0KmEtXhxYph1xjDXymb2aoTvci0pOB6XoFDpz4o6JhsjD/MmX91EupWOoPNMG1Q3ROM3t83xSLXDZGUm8E4modjEOayhjEl2jsEpZc1RyTitrOM05uwtnK2VDUgzn6GqE7QnJC7BriQiRX8rzdn5vaT6AAzn9YoHZhl+c9y4xN8nE3OgCToJgGwDM4tKRrmUpNDyBPU5Q2kW853VfdFklgDqA06tNLllHMWMpvsxI7urtfF",
        name    => "teun@moridin",
        type    => "ssh-dss"
    }

##### EINDE bit #####

##### BEGIN coloclue #####

    add_user { coloclue:
        email   => "routers@coloclue.net",
        uid     => 5003,
        groups  => ['ring-users']
    }
    add_ssh_key { coloclue:
        user    => "coloclue",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEA3gqVHURqyVTzzjUjgMXeCJfUi1VtLnUqIr166az2wNUTgnuxLLLsa1evPz7mfDJwY36UKi5IcUuC9pf1B9q2vD6o1fLrrd4sviGQZsvSrGuJkMEvIhXM8JtKxpwbEgg/3vCPPUV4cfjBqeNJeo2r6vru6oOHOdFuGJO5vDtDG/EmuQVgMirTWvjlONKWqEGxz/5BTnDX8PGZ5dEryAdtXrhvf1wYqWcQCkh+ZSgBqq7Vv4Chfzeo7P2iIPi4SAoz6j3pDRNQDzPu2r1cMDPqZCPeTVR0+P6+NpIVo5xlxops6NsJPEwxYhhMYc9OsNvR58JII6G5Z2T2/0LZFeVmEQ==",
        name    => "weerd@weirdnet.nl",
        type    => "ssh-rsa"
    }

##### EINDE coloclue #####

##### BEGIN widexs #####

    add_user { widexs:
        email    => "noc@widexs.nl",
        uid      => 5004,
        groups   => ['ring-users']
    }
    add_ssh_key { widexs:
        user    => "widexs",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAgEAk8OfxbPvTG5y9tFuhVOHcjomRewB92D8zN67mpX2/Nh4t0wyJINuu4oHDuJE+FVsULDR4NpwifyxaYaNE8uNPrIiqmjrYcnmhMxDcNk5S6PLJ/0klslzbnJ/KZO6aXGVvZF3/JtiKFktkBqBKtrOrYAFDuFEZUTMO8a5xpHp1W03R7sYw954fLiZaWLf4tYYzmVAwqP0EuBxw6qLgMZNEymlqCCIDdQRx3gxGpHWh3owY5H6OwBq3OGZuKYMMpD2GRC1+SQZcQpycTPF3HsSWHYwEmLmmy/HSRBF1/svt7dYnwqZg0c86yHk2mcVf/jSZ7lAo5pgXMFEQcAs+8uLlK2Ru9aOYzxeqtnee8uDhFyfnjjwCXWXb6d8eICNsO3CPrYyIcm33Zs2ez2VF13EaT9ZbmlFBcn6D6fThUj0Ea7iP74hCgLd4W5s8z5wX+Zx8nVmKiKtMmJU5YQaXL/z9XQ4SzRnB0yuMjl4F9/z3hnWzavj5sSrMdoxK/S6t/WmETUSJf8Oq4TyLBd6GFggn7drrUr0EAREk/tXwakOG+zLfZuZOIxu/7fU2uOdgYJ5/U6UBHqHhjVp6DdrMCnXYn+vvvnpAhiJNm9pY8QTpNj54Nkki9ET6CWv3ZPMS1QEq1z3vgZxFMQm9+OIbhqcQF1r9t6ZMT325GfWe/m2zHU=",
        name    => "wouter@widexs",
        type    => "ssh-rsa"
    }

##### EINDE widexs #####

##### BEGIN xlshosting #####

    add_user { xlshosting:
        email    => "peter@xlshosting.nl",
        uid      => 5005,
        groups   => ['ring-users']
    }
    add_ssh_key { xlshosting:
        user    => "xlshosting",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAgEAzZcxnNSBqocQVE830nX4k8Mx3LNDFvOsDWezhon5zy8LKu09nACOnQYPTqGAADqDr5lrq8X9Hme0RKrThltMrihugR4yw8kTVl7C/ISazdlzn0EnaZpQ+H3bgbvzp9Ba5WmpPGx7b/YKROEZeADfga3TEARhj5ZsFutuerQE4LVpVc8iXQwjTVziHCPH/ezKyGa4CmH707qQTRMTFQW/bEcvlUqk+0KJTGKBaiPXZ9vVODDTjmgStiDkc3Rn4il6ifGlWBakm4ky6Md26cGzQWli8ABWOGswpunPNboNEgmQsuI7ifVA/OO73UNucho1g1FNT+33AfhCK9o6Vpztx3seun7rbGMNrv7y4ROe63yh8PeUbF3Sf0GdyB1KmCL+qFMaVOAuKnSzxpsBMUFycXdncrUmVXzdrzb1aXRhE9+FascA5KG6dGirhxgl7Jxk1P9TWtav/swAkJN54JwLM99a8T8EOC7N651y1sNZ32gDrOsXVIIxDArRoj084ZCnLxYScoXUw9qqZStTL/a90O5CTkl4jV6T+OwftHAnqmtrgHlc7vkOFbkGfB0QPu+Wzl0+mTZus9csrvzGAeSpUJXgDniL7Bebd3fWpEaYnB2UViAV7D2U259mMHmrmcAh3BZiZQBMoeDSo2l7Kwi4To0dKa8T/bq4XJwBRgpODGE=",
        name    => "root@jumphost.xlshosting.nl",
        type    => "ssh-rsa"
    }

##### EINDE xlshosting #####

##### BEGIN interconnect #####

    add_user { interconnect:
        email    => "noc@interconnect.nl",
        uid      => 5006,
        groups   => ['ring-users']
    }
    add_ssh_key { interconnect:
        user    => "interconnect",
        key     => "AAAAB3NzaC1kc3MAAACBAL/dFf7qvalf0XqAm8bAB7/VtQEbMxzMHyQV9682MXiin3/k0XWwFplg0+Eem7cyFNyLW8N3I8xsLFgrBzaH0W8OtfeW3/Vp6tVsBkSL/11mZWdon4ZQSl8gBqFcaiprqD1LaQhYvRdCQA0hvzRIOe9MxHK1rmUQPHYS1RCmWzcPAAAAFQDo38eE3Vhd2+ZFDui8AN8o1pZw7wAAAIEAk7bh+NAU0TN+ktgnLl5oDTcGcoxdm7pjlfcY0FQoYfLNLk3fWU0SMqdAjkp3Mdg4b68slJxG6usjqvbFydVTRYbBXIQBkrseG73DQA63LNmrQIA1kz3DdqUi8vqZtX+QVLrNb8pt/0NVmSvUc3EAAx7N7BgKdTGOJNoATsrPdEkAAACAYLLpo4BH4Huf3QmFC6D91nkQh1m3EwgyDxHx2mD+NoeQUlnl4/rzhhTqQ3wFtgd9ia+86bFr4wIN4f0TFjgXd6Mcdhn7swQMT5fttfvhgrb/bD6kDSE+8PZrfExgUEhw6plPvLi22tCBgAJ+Jfao5dmz9IWMU/G1RIJSyXAKtOw=",
        name    => "interconnect@pjotr.interconnect.nl",
        type    => "ssh-dss"
    }

##### EINDE interconnect #####

##### BEGIN cambrium #####

    add_user { cambrium:
        email    => "noc@cambrium.nl",
        uid      => 5007,
        groups   => ['ring-users']
    }
    add_ssh_key { cambrium:
        user    => "cambrium",
        key     => "AAAAB3NzaC1kc3MAAACBANnnPEOmV/40/HvwU+Xr5kkEF2CtJ15ZlYFfFDYqPSxEvXKwdUW4LL++SWj9YTi6sEEppH1t/0oSLwq/RXs6uey1pBnDMcikLIPuF5xmh3dc1yr38cLefD/1VfncXIfBpajjzb5gyhvGAMwCednKttOS6HMFYhj4XK8x7XF3R1dNAAAAFQDWRIJVFVQr9Rizit+exU3uH0ZWuwAAAIBXVZNjdibQ0blGrsNAH/pz2yPvtRZDFlUHHkLlT41pj+JitoIW/zPrBcELTRl3Bn9hPrMhs+arfT7wPMCwtUhu9RM23H0AY8A6iWMd+MAjyuRVnbKm/t5UY+9OeSGmhY0VmSd1VmgtL1WFW2Z8JruDU+SKobBs+FAnAPOVyetXogAAAIBu3pU9tLu7VZh96MqTYAOsnhkFdhcSemgQDtgWhvWN4sOah+g2i0VuqPC2G2bRpiiJO2Zu6Y6OguA46Ie6l1PCcm1I799vqe5545JKUGi3rS50lX3udH5j68twbvSTpniTMQzaGUdKB67rWBsSABKawWc75f1ifJa1eUdHxfoQxg==",
        name    => "cambrium@cambrium01.ring.nlnog.net",
        type    => "ssh-dss"
    }

##### EINDE cambrium #####

##### BEGIN zylon #####


    add_user { zylon:
        email    => "smite@zylon.net",
        uid      => 5008,
        groups   => ['ring-users']
    }
    add_ssh_key { zylon:
        user    => "zylon",
        key     => "AAAAB3NzaC1kc3MAAACBAKfdyrV1X4PvcSvGKFW9sMSLXqGzaUOrQFQIAceg/tl+GZKkL8EPMSLW19aoORupsuJhQMIv4Qqe2oFITl12R6AUnzbcTb65B+YK/3dpMmzBce5IpADUdTyLVzQSiGUF5gsfw8C79fLAkgBi6JXwbVDewzqnQ17XX1qc11R0sMZNAAAAFQCWZNFJhB4e+ml9KI7d2XEVrMR3oQAAAIBuPk7yGJc4tgoCZKcQUUiXDS9jyv9YuNUkvCWKBtzgJjcRmtrF4b5ntOqI6mEnuMGUBznzFcGI9mCUQHnfb/kpLL6QSzcLpTCfNXHTevA1aeG3hrIEXnYvbh2R4IpXPjp6kN1/HUfJLHYzn4svfXXZ921cmoa7iT86M4/TWKH0kwAAAIA/IYO8R6PA1B42uqiSNVbklvrecua1hKexlG7JO0WitowKQVmArKe9o8uO+2ri7k5DXGlPLNpoc3OqEWo8GOG3YMtQjEW2MUblBVlAMN7bFLj+DZSqBrEdiFZnZ/azElpH08m+ojMI0yzObGqhrnEodCkYDYi5LgVXXrOMiMFnmQ==",
        name    => "smite@zylon.net",
        type    => "ssh-dss"
    }
    
##### EINDE zylon #####
    
##### BEGIN duocast #####    
    
    add_user { duocast:
        email   => "noc@duocast.net",
        uid     => 5009,
        groups  => ['ring-users']
    }
    add_ssh_key { duocast:
        user    => "duocast",
        key     => "AAAAB3NzaC1yc2EAAAABJQAAAIEAghMY9EavxopexZ0HhJvzDYBdIvcf4iBPzvfLrYshuF4keakyugfQ6mob2qlssVIAztJRrQfUDtgvNGKxOFrCzV9vXwf5bJUbCPbUIoSQTdoSBzwl31Q6dHpYBc5jQ5Xmez8wcc0dtxdMun+/eVOVG+ErghC8jpoCVQrwu5ikc2E=",
        name    => "fabian@fabian.office.duocast.nl",
        type    => "ssh-rsa"
    }

##### EINDE duocast #####
    
##### BEGIN easyhosting #####

    add_user { easyhosting:
        email   => "systeembeheer@easyhosting.nl",
        uid     => 5010,
        groups  => ['ring-users']
    }
    add_ssh_key { easyhosting:
        user    => "easyhosting",
        key     => "AAAAB3NzaC1kc3MAAACBALEAhT8vTvMAkAj+Uk0PrGh13BBWDzWlJs8vuWf5xK/7KF5sR2VHKBYmOJ67pGtRc5i+NOkhj8sWjvF3uyVupwTUICUqTpeBLI5R/P/jB5lUeiYVZF3HzV+gDSIalijjY7yZrP35CviZvuyP5Ntr+eSFNCkgqcAKZpphmDHPAASDAAAAFQC5GbXzD7xPYH0kI7+hOjyoSBdW+QAAAIEAgAAI4tMDOkDlfJCbQfDjPMcHsGN7HNxpz9obx1cbJdZOBOGd3fWsYlQmOO/NBvVDRuaQ/JRXzvxP9BKtf7TEu7icWU4Q6PECR7Z4NpgWX2amVuMy2ol0Bs2bcnbM3UHa06IgLX17KaE+Jor0utr9SHMPFClS2doKsTnuuzRQZFoAAACAMiWkNW7j//w3kih64KBvnozjrvDGj5hVyvMq7PZEjwhe2+vx8ErY+af4SnP/a3j1wyTLwMMxDr2+c7143ZRBil5Fmgr9YuPe3OQyx/zZ2AJmCQiWQiZ1EDvMFPl4gcD8XWH6RG+zs21uGLwSShthWUMclTULBIZqUbMA80bJdx0=",
        name    => "systeembeheer@easyhosting.nl",
        type    => "ssh-dss"
    }

##### EINDE easyhosting #####
    
##### BEGIN previder #####

    add_user { previder:
        email   => "noc@previder.net",
        uid     => 5011,
        groups  => ['ring-users']
    }
    add_ssh_key { previder:
        user    => "previder",
        key     => "AAAAB3NzaC1kc3MAAACBAOmrANjEYNBp3+yxYd6T/x0Pe45kAKfQ/rnM256Vd1ytV6LbbHUXPizQjVy/40rA7Vem/uux+9Cw42IX2ss62TFx2JSbQVcp3HxPvW/FXd55r2kSVvARI35OYUWU6KQWH3f8zrFvDtMTkpK/GiB1hB8WJIMMtZZP64r5zyqsi5abAAAAFQDoRLfZtdES20c6SCYHGOtEn1ZVPQAAAIEAr8hFL7oZCs8JRTzVJtW6qp9h/j1cFlTFHDACRy3dN8VWIJUt5+PQss9xfD+0ACobqOo6N41qxvWE6JEfchd0Aeqwx2Jie70eorj7uJKUTjVDFGx5S7T5ZRq3czXlfckzo/xRI5l0nN3kt09wp4G1zXiBmPiK+GwVF06uHSbJelIAAACAXxiOe9j62EgoxRgregDNp32s5lxVFbSGqpsxLOsddMBOB98pa50NluvZEaUwRLv8kK6+YgT4WI/q3DcWwEVXY/ZUP0IDpUmtA8PUQyouy2lBWik746GqN+Re8b5NjO6OwuNfH8bTb1HllFzc339O8+KOHN11t10VMyXzEIo1sk4=",
        name    => "robin@previder.net",
        type    => "ssh-dss"
    }

##### EINDE previder #####
    
##### BEGIN leaseweb #####

    add_user { leaseweb:
        email   => "noc@leaseweb.com",
        uid     => 5012,
        groups  => ['ring-users']
    }

    add_ssh_key { leaseweb_ssh_1:
        user => "leaseweb",
        type => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAKrXxLnA6hi7ppZZHOwILVmMmG02n8tRGdgHXxuhYgyEoaEAVJrBPvdziYGSc1MLSXlXtmm+XL8uDMQTnqwb3YZiKKW8v65Se35GdWr1Uf3Gk2jF/M7lq6zR2ji/d7iFq5zUHSEWGOYDz73feDNhJu568k5j/WLSxaV0m9Z7lsdTAAAAFQCeSCQTuWFZVtQYezeFDwDpOf0OlwAAAIB/AlZANZgGYBIsruBaYXseU1jfHm4e5xNGJBmFUtrqLgi09xq+kYpCQITCpPd6eE3MLJ2JylW/o3tlREtvDU/oZDnfG8DgVIz2rtjQ7RkeVH0Wh60CrXn9wV01s/5ih9ISO6ECMV4vr3KWX9XgmQFG91YqXTdcnmHwuYZUeQLQ0AAAAIA4h0zTpnycHcmW2Bfwkor0X2mHdNSZad3+wEx3Bf4DE8VpXMNbJcYgyZ0STbvmGwyAnLZ78qe0+Id0ywkTRXtFd7GNoI02qMnQgBfgZDCcwxHxlcG4v9iI/arCCMGibIWf1Fzog/TYGiJIPExB5WE7G0G3U9jKnxQh3zxG2vtUHA==",
        name => "bas@louise.frogerstraat.nl",
    }      
    add_ssh_key { leaseweb_ssh_2:
        user => "leaseweb",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABJQAAAIEAkCgRUkL3e3vm1UO+mQMYhnxdjOavmZXBeBWQO5X9T0y7uj70M+bX/Z3lhOF4Lq0VX4UL8UEfRy/aYa6zxv+SmUsvrPs4Lgo+yeLAVR+zxnZLjsch6r6zFV6+v4dPfKJUO+58bI69+gIUctuczwQn9nvmp76uPbsTvGXVdbtuwzc=",
        name => "GJA",
    }      
    add_ssh_key { leaseweb_ssh_3:
        user => "leaseweb",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEArf+dRrIwktAU/7jF+Cf0vfL8AF57+ybcLmOoboRzmXBaAjlEROWRQpT8Zb4gum3Y1JIodckTcXEJPKSl+GTeAWY8ZM46GITRjkVc/mYLItAP88Vd2l/2qqJA4gUHWx4nsPn5jZE2RbDBHitWnBVF6Jr+uHkkyH4pVTta392aVxoXWoI8gynXvD4NfrnHJsC5zs4RP5U75Oe983E+OJplu//AsSCnFg7DqWlJV7jSHa381hrfVXftrVO7ItewqSj3XNK/LitF6GHoyviAmAq3re4/hENglXzXHk0HmD7kj86r6V6BjrDVHqwOJAIypsPouZ6BNjncNeAJGEAXYblwEQ==",
        name => "RDB",
    }      
    add_ssh_key { leaseweb_ssh_4:
        user => "leaseweb",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAwSJX5z6hEEp8e+jreaajAjf5dR211J3nJORGBEkJDwGmdadvPs0xEFJKlrmqA3Wng6zNufN/fYaB8RMfXS4sawg+xiHNv4lsCbJRTXziGPS3FBoUvDaAr82tAiStMCk0A67bvVdqnNNQ4NIz4BTWNGiL2nM+ZOm7p8rLNDpbOxLOJPZd/R85nOzIydsnzpL69OxlqRJtlJl/9ZZEW/t3KfaFvymNeeiNMwzwC3TO5LP+C5UJWrFTbx7xuvUfraHq+csHLeV2QsuhFBiUU5P8U3uwCKAlNnYzcywc2Tbzrl4OMn9hPFb/M4YD83tYmoogJmz/l3r8+6yxoCfpyNeKPw==",
        name => "HIJ",
    }      
    add_ssh_key { leaseweb_ssh_5:
        user => "leaseweb",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAsLvoKmWCqyIrwyP0g3AfXpi1QB0e0VQU7Y5jCAkfb/V8sovrB6daF+XXFH2/lR9T17pVJmJyRfEjtr0EvdGY/o0C3R8CH7yVYoPEPk7GcimB8y6M//jc7vzZ5rwel4tXKQ8jWARDfEGmwx7s6m38/89KIm0DrAI89VS6Z2XNbYhct25POuIVJp5o/kVoyhv0LGZTSH//j2AzMW/ER3/srH+v7e+6IbypHbpw2xu8KJWUwfrvLgujASM/DbCquaQDd+UFJ+ySFmEm6yhz/gRPVbF99ihAmrtY0mN8JseLfwXAAz/vXe2a1y+aNBP4bgU7jMc+Hl6/WgxTkUaLDvJ8xQ==",
        name => "HBL",
    }      
    add_ssh_key { leaseweb_ssh_6:
        user => "leaseweb",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAzBtWuVoHct4fH+EXBBq+OUNxjP7jIamG9Qomf9cdiUDDiUsvM8umbk1s8zRkT+7gZxUDwX/qyr1066P50/OV76J5clMYGeYPUbJBL8wBi2CmokK2EoWk629FlDoZq9eF82coi0mULJ6Poux45t1dcF8lbJE7SJRG6gVYQbYw78pJ652U4Y1wa3OzdmcWGJcc8vAlbZ6Cg0kDfzTeRscdSbQsd0PTAKHyr1G8uEQEGJTekksJ1SFHcGIvnl3uR/i3V8pNa7s/bY+ftTs+ZuruOOEuhbGaaGfKbwd6Q0Df/YUJ4fG08H2P1uELcnE8FWnEyAV1XwCu3b0F1Xiexsbe0Q==",
        name => "VLB",
    }      
    add_ssh_key { leaseweb_ssh_7:
        user => "leaseweb",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA6Pvls7HFmqcswuKQI9C6rJWUo18p/vpOINKaGjrt0BgZT4IKK6ArXKUFOSj/Sy+vfRIDR1vt8iUmCNiSLs1dIEQuweFkwzbk13mBGAIqM5sRb/1zFMEToxNeisPdaXW3CnLxTgMqtKXUUEgTU7wGjvnqmqd5k7221Hbm6TtNbVDN8kge/V85sOjl1iySLKbtJHCMmdsE0LpV8dVyYAl+yd6RSgjGoywAto8GA+sei+ogfwrNBqE4IisqIxVSKLyEBmUbWloynYfxRbBh9hB3gngtNiGm+vlbXaylxy0FwEnLYPFE72u3cjat4NsPxCWtLX5k+V0cY95p2ctXBn4ixw==",
        name => "TOL",
    }      
    add_ssh_key { leaseweb_ssh_8:
        user => "leaseweb",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA2oT8VUGJb2Y0HtFzLBJ5z/mIUftYlQwdlk7/9O1GHCXgKE5cgUI8tH84wfMNMAVBQc+oJbUZkHDQvmc+bmUs+rSSwsUEo/y4obt2TwjpMqZHhX2PWAk+xjFB4GaFxiqriWqk6HYSC9N3DaBjpC6l8MSGpvvrcA7ZBHx+nt7jVA+f1zhd+FMDWelS/+Y6W9VGYzTmOPpvHYx+r9a7zwdsbVzJ/SEGKqyae00/Ke18lbjhSCy2nxbvli+dvZLuiq+XS7XHk7rR7b5LG6z2YjRZ2HnMsViEIomuzDisZ9XeXefAQZtUJbC+rbQ6XTwqlLLl3MW8agjdzplK5+3Y2nnh+Q==",
        name => "KDE",
    }    

##### EINDE leaseweb #####
    
##### BEGIN nxs #####

    add_user { nxs:
        email   => "ralph.smit@nxs.nl",
        uid     => 5013,
        groups  => ['ring-users']
    }
    add_ssh_key { nxs:
        user    => "nxs",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAAAgQC+WX1MzDMc0aKMuafHCsmT0tYSMBC1qb2pwCsCqgnskQDvTAk5cjlMwotptbFAUUOxjLY0vEP0KoEh8OFjkJAw9vMlj/X+H5FcWymoNzWePg/mmUGZH2hBWjNCCGuJnyJGPuee0P2zgmQ2MmVLU35hBRk1nEJ7K1AngOGPerY4Iw==",
        name    => "ralphs@nxs",
        type    => "ssh-rsa"
    }

##### EINDE nxs #####
    
##### BEGIN ic-hosting #####

    add_user { ic-hosting:
        email   => "info@ic-hosting.nl",
        uid     => 5014,
        groups  => ['ring-users']
    }
    add_ssh_key { ic-hosting:
        user    => "ic-hosting",
        key     => "AAAAB3NzaC1kc3MAAACBAJYfi3B9pRaQf+webLv9FwG0M7QcBDB7AeKoXc3ftrHeKV9qhA/woMT2BxFh+146mmMZk61J9v2XanPIStCajN0snhzKVI4Ja6qt81uz5p0c1mICRpu30zA1YZvGj2YYfCVEjuFM3f35yJjKkWupWwKsvg1I3OxhR0sKUuhYhl9hAAAAFQDUdyWvm8LCrlcTRUkxLgK+2kOkrQAAAIACQvGwQIP4TdMZ8TVjSKqx7J1hX8XAR0gmhlFSoDkTHUIW/fuKAojUILZiTJ/gKsrBFTnOqGFnRldBgUc7zYMGj+ygxkz3K6Bi56XLep6jvTtn+VtA2nHNQrR4Csc4Hc9FAqZkkufffEHXA9/LesVay4WNWpIAqMJHB+EeOzBUXgAAAIAkeydOkjSAwIS2OlAMFyOoVSNhAOKUxphit/e0sRGjeMPGCgZuFiIFikL2btRwQoeeux/Y73VySdqQc722tGvMCQtKQg7i0aRqH/JxD77LgLAX5mO8cyOA1O6vFiQbVRKwd2wrifCuIMMJbKKsDMWdeJ4dVUREYYRzW/5rZ68ipw==",
        name    => "info@ic-hosting.nl",
        type    => "ssh-dss"
    }

##### EINDE ic-hosting #####

##### BEGIN xs4all ##### 
    
    add_user { xs4all:
        email   => "noc@xs4all.net",
        uid     => 5015,
        groups  => ['ring-users']
    }
    
    add_ssh_key { xs4all_ssh_1:
        user    => "xs4all",
        type    => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAIEA8dDGdThW8WV/k6c+XIpZGcv9IsK067cgT88alOQtaMo/cxCpX2ESWo++RCAwc9SUWxjrsOvo3x6JWGoVOTdXq4SnBwqgX02zZGoL1DjZwfQxfF3zN/AC+uKZTqgX1RnbFfr571TO9laTnJ3dSu5pgElsBAOfURaVGz19ZhN98Ds=",
        name    => "Carelsm@beechnut.xs4all.nl",
    }
    add_ssh_key { xs4all_ssh_2:
        user    => "xs4all",
        type    => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAIEAzq+/8IJputPveyQKOFufRTZREZ0uE/P7u0iYbdmMZFsdy56Wt6/Qvkzny/f9AKcHqFuwkDgvYIWtVeZNKa1aL1iWqyjbC9EQkVq37vEzmnWLJRk968W9owoFV8C1JE/iQd5/ZfoNUzcolxd2jTbuvdQ8LiDfEivfbOroi7KwfMs=",
        name    => "maarten@macbook.carels.info",
    }
    add_ssh_key { xs4all_ssh_3:
        user    => "xs4all",
        type    => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAnNQRiS9gShwU5a3t6WwHDk0QaS/XrBBUK2SOq4vmH42GLsc/qwyVp8PVFFD+xepMx7XpFmSSMiDZyGDy6sSgQJauTbkdAVTSkvR62/KaBrm2uChoeYZyBVkMmMjoG8LoOp2mPheKLSuMgKoV9XbUW0qi3ERBydQkXuSksZU7U/94Zt0QYkBMecgGh6TZrXKf5OxAamFT5a6p1X0DC5pb1bFKLDuHHPSojBFCWTYU4D9GCDank6GhTWn4JJ4SeJEjdPegy1WKfEzSeOIScRGhByIRAzjPv2LZChIGR80MLHgo0PKrLKJlQu3FzvQKFZEfq7iiznz0g1l0+9c6ezLyeQ==",
        name    => "carelsm@netadmin.xs4all.nl",
    }
    add_ssh_key { xs4all_ssh_4:
        user    => "xs4all",
        type    => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAo8iWoeIUYwU1/k7inCwSJQWNDIkQbIklefwmXG8U94Xr07zdQzvc4WCiPycTKTjEmEtc5KJTrPanwpX7ohPgNcWXiW4LS2ceDnXN+/EbZ4nF4MywfRebAX7Yd0IwdqESIX/hvfV9GzmoaaGo6/U4WDfTUsoRu71CUEuBY2jIygMhupvcrD8CbQD6PjkXAkgFKqXoP5CW2puv+MExGpLjJSwcdgjRi2O1SXyTo1eNSnWY7DqWCF6ptJDxWYeBP1LdmnevYLxSoCcJLNUB3m4+9/u+IhYZCZD2N+rScSfGYho66SJq+giQ/peL28gJ3cBK7gbw7T/ooQq6e/W2AV3Wnw==",
        name    => "arndm@netadmin.xs4all.net",
    }
    add_ssh_key { xs4all_ssh_5:
        user    => "xs4all",
        type    => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAO6y756diIRRmhXXepPypExQTDWTCcsC2BUc8OfM3KNY11hYcSu97ClSM66BVnbQnPDmEUH7M3dfKTpSgaQC0x8IqdD3kE4UJwcakqvvpUJ6cF4TPqlUlpPtFdlIcvGCLJpKGXTAJ/jO0wmfPjAmhxRii5H9BzWVhFPJ4nE8FyxTAAAAFQD2XsJYgLx95J/YxD8OIGiTsZjV7QAAAIAMvUl1zunvUYkqJZdSbfKzeN6nnkBl1PqkWxSJLy+L9XrSMyigTGrN7pc3MVnREwykYuC71W4Z8S++m8bT5s96bJ+YI6L5BDGUG7wYyw+Ej3omh7oCulEkSL4Tpd+HM8ovxOgkPV2AsNOTEUesRE5YxJTJpb33QmUpkhj8+7lg4AAAAIEAkJTIR+383NcOsIRDfIrS1tyUj4xrjFe8KHEFjpGd3J3YRCAFyyVnF+/iII717lycKmdTZi5rJPcdzjwEjlpF5Rwu/MSgh84KJeDlkyXjJEpt+jzWzjbcZaORmsNOUVzqMq64QRGoRXFzWBAePaIh2TvVkm4r0RCFfCRyEqyW1Dw=",
        name    => "johnpc@lsd",
    }
    add_ssh_key { xs4all_ssh_6:
        user    => "xs4all",
        type    => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAJg/z9qQA57r7lQEUeHscMotlasH8hKRQcBmyeFHd92ncY2pWOoDKtM62kd9xUWHxRMVhpWxwLpyzpddXENaLRl7gFtPz5gUXBSfcRANNzmaW9d+X+ydu8AcYR7VKNouAhkNaXXPVAFT66RW9l9sjzdHRYqP2CPhmQTpe1x/CHYDAAAAFQDCpLVt0WEaL+L8NUsYVKQqvXl4uwAAAIEAkRKhV39R2ElY1huvtBLkASEjRCGVYvmLVa8xcYrhVJuN2BVD0rBrK9zXDcY1j98miNvf2kfvi2JaANpaYNSr/C8R48rMeOAegj1X1bp+wQ1jxECBnhN2VhwIcZakGXlMDtmfoYkI7gbEpPGvCIAlS1B2fhsRCoJLFFbKcwRz90EAAACAXa2X4ByVZ1o3/2LImQdVEBRw8+8EhG/UhulrLksNa0Wnzpk4PrR1YUdWlvBnfG37/pcah7Tf4FSdL76ZGSclZGV+oHVjqtyhuJc0ZK36UJQ/GxGSbA3d2j39MIt1QiDlysOlzyR7dxXbQZ1jbv1d/K2DDNQ36y4MR99nFF6aUwA=",
        name    => "john@pc.xs4all.nl",
    }
    add_ssh_key { xs4all_ssh_7:
        user    => "xs4all",
        type    => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAL+cCWAag3ikC/WXp3WF95ek82JDLLR9Q2jCrbHBaWVoi8oq57sXVWPwZjPqF975E8dhWuZMmlKeV18h9lFEf4WZIadx0H1v9notCMGWXIjgDcPv/vtlC0GYAeaRIRVaZn2DmAgDYDeqvrD77F2wmXHChMYdNKES4Zr2lRCNNxiLAAAAFQCaArV2oqbWTZwQ/0uP3tKPG6EVLQAAAIBTC2pUOx44tNYoWMWV7F2ktiskxlKmayT8R1QAtcCB+w2PYiIYHpX0Qo4pYpP1gVpSx6FWgUkxf+eSfgbgaLsM9p4Xp/iKQZw38W3gTWYVHv/zTohBBvlZurMU4KFLFZonk9E/7CTVf4z7a+To07BXXIR34VfxB2kaMkSq8ODcfwAAAIEArf9ZF7R8WNNpA21Xl3P+R4dQq0CSSdewnSwZQRoxcRLyQO1g52K2fLno4FaJw9IGr8P2z5hDKycoOojsEpv12yX67drOW8wsn+d8A+XkuVNPF7ArObvYfwAxbcV7J8cw3E55PnWfJF9zcaP2WOoc9FtQ/TgWGrE4k3XSQtk45EU=",
        name    => "kiersb@mescaline",
    }
    add_ssh_key { xs4all_ssh_8:
        user    => "xs4all",
        type    => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAAAgEAscnTkPWPZq1U4PtgJ7ObSPKNdTSNVYbV++3w5k37xmtOhMPZvf9aDzjBR8nymv7JzjPiW1yFnu2dg54tARPD8GpMxr6vCz8VbzbrXL5ROGMYKUGekHKjaZmm9rPf8HO5OHswBceycH3eaZe/uc3hPUVUiIWjeQMWuaK58Ktx+jUDLwVl44mL5ELGAlkq0G8f/NryEX6ymem2KdL+5Uzhv8eGBu74LFE6kj/OLZ2k2YX2XSvRZpObgVF+6X9nxvEpkzjpfnux1vnDVvtHpmbt1EY3H2xQwStMZrSSU9rMHHL+yZcmnW2QC+/CBs9XGIwQE1PnaDAnPR5qebNoCX4MC61i/IP12bwONaogAZb2En1j96Y2k8fjRLb2TKIFYuF3usvMwsRJwpmDxXzZb+V/p+KREoCAZisVi7YHS9uQKdUBcrFolGqmcm7/eGN0uP41jbaMEPVxRdqgrSIB6FevYQd01hsSXPQKyFy4r/9DP075f3Xg3LGof4qCemH5ID+e9g7sG8pwiFV/nDKuy8iKmfVqKsUDNmiCbc5EWIXAt+PPTPiJAHhswikGJkaRPeTGYiPvbt75JSBw+hiHla+bB+15vCNI8V0MSv/qo4KC4X3JnkMXPP31pXcVwC01BKW/OTT0mqIav/qAawjVMBqiD1xbMpYnxJ08R3BxFVRLd70=",
        name    => "timr@netadmin.xs4all.net",
    }
    add_ssh_key { xs4all_ssh_9:
        user    => "xs4all",
        type    => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAPfAC0eY0EgYTkUMQ8oxMGdMqJg1LU75+rcVV2kmPThZaZ8CqM//7zrAF7T2vZGl7/YAAZwD9uiXv/VceEXbVifzI94nPdcULhSv2UvBr6I6fP00yA0jZrMNYEjo34m1OpDLauwVv9djMXOqxL/8QCCdrY2xRyif64Z+k00Nh0e1AAAAFQCoGGhUPUQ08k14aP+iVZxBj582wwAAAIEAj+iPMJieyhex3BIv4ESyjVx3QnP1g+WTXEb1aj1WLCuE/QSZvmD4qQMO3HtGu5H3UROsxJUKSjsnRE33x1V4XWKAK0yuoJTFKxEgnrmg2URUpqhciMCqgC7nbIFCSpqWwR+Md6vms8hQJyDbfWVcjmh4VkCeaqnL6FNdecsJlqUAAACAGfND6IM304KZx3bQ2MMFUpBqvUDq+WG+FqAlhCYvERMuEIYPfdTKY7vzELVKH77GQKTPWgDU1i3pYhVmSiNvQj9debkyMpdGzPIL3mDf/WEvrXf44cdhx87tk7zB1f9vOxIKigR3UpSxMn4PO3on3rJMPlvTNJ34cfj+Evlq2wo=",
        name    => "timo@timo-laptop",
    }
    add_ssh_key { xs4all_ssh_10:
        user    => "xs4all",
        type    => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDH1VWa24jtQ256NJ+Ya+vLc3iK+MJOhHJx3oXl1a9jB2MOCWhIkWS2K7LBPDEISWSj+uqQJGR9XpM7AU2+aLYyDiElsMCgWQKahK8bfQarinR+3G9B8F4tD0WN4EIenebLzpI07RrshHzOnjQo+W9yHtSrenR9qkDWkiy1BsnM2j8yZtCOTJBnoXmh2h6bSUIG1568m2fKr6lGfiKVr8Ds+cMcQNotBPuVNO1ZQmTQQdCZP9DGnlSBi7tagQTqlzgu1wsyPkk7Mf36rXqVRva8OXlng2WOLjIX0CVVolq1i5gvrwNtpR+SWoJLtRdc5++MBLn21Ks0Lz9HNYWlZaW/",
        name    => "arndm@mabuntu",
    }
    add_ssh_key { xs4all_ssh_11:
        user    => "xs4all",
        type    => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAJ2TUhpngeAKI9zb6HTZ2G3yUfVp9F0b6Jy1Kbj4V5O/yOeR0oIYs8sXp4uvcunOfKDQDJhRQN8AhQK/FAdT3vIGHdZyifKrlBOWexmN9edhXHV5bLR59uGnq2Lm+3TihKgTgjcpx6STFl9C0HdAtcAYvgnDz3FBOIETXJnyGhXbAAAAFQC2e0EM+cqc3Pn4XpPiFq3Cys0TGQAAAIB2Skwn/2Myt5MpiC9jLplu+ZApiiohp6NcV1ZMHzGjH53efb8bI/BOIxRcNKlU8rHr71x6UJLg0w+fcbo1jdmgspayTaj/mwQq9wpNfcajlmnQYVCdQ3Y1f16KVXjAVTgcZYDWKVt15RotY2fGRjWEVmJ5HaOqCiDvGrSEiKyflgAAAIEAmvdEH47gTTZWqtbEPrXupIMZWWVhLaXZaP3yrLDwhy/0KqurYT6jN1NMJ2jcM0QbkywwgdL3cQjtfVCwG8tKfPXjCCFXjvTksmfyx+r9+MJqWIyf/7sk/Kl1IVmi8y7sCPEUvm5cMiAuD/6VJbTXQYQHIphTbOxWg0b0vKPBV38=",
        name    => "jcqschuu@shell1.office.xs4all.nl",
    }
    add_ssh_key { xs4all_ssh_12:
        user    => "xs4all",
        type    => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAMROwonJ92paPJQkJEIVz0f/Kn7+U+Cp0o8cGmK0t3IUzOdks6z6QMmtvYpZCJBZKJP9PHiydUq17DE0NJmuzTHxrZKzAcklf3vOuViiG2OtphvrYjYMO9DljK+qY/5t7w/sLSjGRp/CobghcBr/TA/7vtS61s4uOQZkQ0+IcMKnAAAAFQCrxVJRkWcVx98y0uXA6UAYUIoylQAAAIBlJdVfbolpA2uzskZoAJt6DGEJh6jr9jFeVuuO6cYC0WkRJskGi9ZazwtDf49VBwa2/FUFahLoInxuaX8kaI6IozB0yLF6XzuTCeoAUBCRLXl0W28gfUebpMjANj5b662N7f77fxwrQV9dkx94CJJqOweD5f6MhmbxNFudaTFVVQAAAIBRLEAP5UCWsZJ03KE/soTLkU2LxC5Hk5ryQVHl+jiXhqSvTezUaKf8dIrmR+Aa8zsTzccQPDYwGnushk04fV4ASsSrSIYqn8WlPrcghH9XuzzK7cNGMs4/1F1h35ZchXkXBtIdKrZVdPjrmwf93LnVSolLSEBQc9oy39Pbf5YpKw==",
        name    => "mikevs@xs4all.net",
    }
    add_ssh_key { xs4all_ssh_13:
        user    => "xs4all",
        type    => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBANmLy3/PuiImH81ufL9SiMACN7vumP1Q0QLHS5zOBAeh5Jdi2jMRKdR/M4vFe3KnrSH53j4INR/kCOqfpsMbdUG2HWNKbjp0UTbRQIsS4MOapSYx6ob4XRveJGH77yCgjmeuRR1OnbFzHTp4p8PvBnwv2muyBh7aA5f1q8Y3O2WBAAAAFQDZJM0i8iidyLhxS/1B6hsylC9lSQAAAIAlFwvhSXK7rGY2oNdLHRBWmKZ7SJLfObEZvnBSKSbzmPFK5wGLnTGMa2sMe6WAXnBaOZw1p9ZCur0VxMzrBpxde+EcbQ1b8Zni47QOUM+luz6We7CWboGpI+ZbJst6lwzl+CA4gGyK3QB2qIZHGwd+ooXGvDqNgQyKwIp322X7tQAAAIAqvBRhKigmTBy4wQ9bnc/wyoQa2kv/MvV5mlkVhIOhOyaSE7XPq48MIcDtSzuFPR86FDguibc4FKWFhkhs7CVs10iXXKyY0cUNejfMqvvOLundT3EU/r0wNMcuiw1xpbVChyKuXYIbTUHzqH9Wym9pI9KoyzisosodUI1Ab9ietg==",
        name    => "remcovz@shell1.office.xs4all.nl",
    }

# de import werkt blijkbaar niet super goed
#    import "sshkeys/xs4all"

##### EINDE xs4all #####

##### BEGIN nedzone #####

    add_user { nedzone:
        email   => "noc@nedzone.nl",
        uid     => 5016,
        groups  => ['ring-users'],
    }

    add_ssh_key { nedzone_bram:
        user    => "nedzone",
        key     => "AAAAB3NzaC1yc2EAAAABJQAAAIBr1P6kiPiQT+xCJVAmMQtL8VOerIv7epknE3n2ml2rcdlmWIMizGEtRI70rLZmBqyU7EMEU0c+hiq/k/HuzU9FW2Vla1VWi4pUtiqmwQK8u6uHd7tMKF7Vju46U3AWTItDtETIbPkSQyqx9Im1KZGj8FHrDlJ/lujk1olMjNmocw==",
        name    => "bram-rsa-key-20110201",
        type    => "ssh-rsa",
    }

##### EINDE nedzone #####

##### BEGIN nlnogbot #####

    add_user { nlnogbot:
        email   => "sten@snore.nl",
        uid     => "5017",
        groups  => ['ring-users'],
    }

    add_ssh_key { nlnogbot_sten:
        user    => "nlnogbot",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEA3Cg9Jq+mEZwlwrm44P3swuEOM0VoVVP1Bm5r/+wO2luQWu9hWx3RQrKNL40gcavaW0e+pv1WO2BkLGVk/S7gcH9z9bFf7JRb9AymlYkwjZqHN1EQs5eBYLGrL2o20L8Wsb85LjdcRzAe116kguESzsdpdp/qO1F8UV6w6D7b1UDsP7lGANEJtGYIfJon65gEQjnI5X1cemEcGAcXi1SA0stazNaHGpxGRuaHHpgXc5k+YoU7+WAXLuTi5NR51NjDpptU2CApb/S4HZ3BH0j7kt9W1AuWN7+eaP2u3oJfWZZrnB73Ko/73WAF3uVDVabI7jEv5D0Dl+OrkEUuamCJ9Q==",
        name    => "sten-nlnogbot@zem.blinkenlights.nl",
        type    => "ssh-rsa",
    }

##### EINDE nlnogbot #####

##### BEGIN oxilion #####

    add_user { oxilion:
        email   => "noc@oxilion.nl",
        uid     => "5018",
        groups  => ['ring-users'],
    }
    
    add_ssh_key { oxilion_wouterschoot:
        user    => "oxilion",
        key     => "AAAAB3NzaC1yc2EAAAABJQAAAIBlZkdBFEeyjt41M+JefGGTz+qZNU0IqH3yQ7bQC6GccJ7OqXsrHIkw6v1wqKxxp7fZgROxTlERQiV8CU9EHRytRw1oB1AXugt+gYd48qS3m7/e7ldUfMQ4bCZ7geyAbDuxCScpmBh5xpe52zALSgw45HTEvL+RM21sGuwOrIgiUw==",
        name    => "rsa-key-20100201",
        type    => "ssh-rsa",
    }

##### EINDE oxilion #####

##### BEGIN ebayclassifiedsgroup #####

    add_user { ebayclassifiedsgroup:
        email   => "DL-eBay-Classifieds-Networking@ebay.com",
        uid     => "5019",
        groups  => ['ring-users'],
    }
    
    add_ssh_key { ebayclassifiedsgroup_maarten:
        user    => "ebayclassifiedsgroup",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEAtV0MJYFlw+xm3h3hNKWWC3DKUQFhFDDoMBshhCOG2uS7QH38E26ZMCH0pi10h3ZNIBgVoToyOSXVgSYvhRqOemqL9xt/TbKWW9zvod9WocoYHPqoLymcPQrFK84VqcZ6ymGvjMeR3f5wAyRoVAWuSPocwEMFb49pOeIkjpF90oO0LfkNxrkhfeIxecdkyHHXa+WZmSN8YFGc/6ev8pMoAhx6x3/GC04Fi+7QQLKhcRZoHrklzU9qoK1XiI7VtlLBI9QjGsFObnE27z+XNgtzuj1j3yUXZvjCIZ4I53a+Y7k+rEEYwuV9Z/SYyX/I4esLIUJS936qN+k4o76ivl8XAw==",
        name    => "mmoerman@l-lwr-00122309.corp.ebay.com",
        type    => "ssh-rsa",
    }

    add_ssh_key { ebayclassifiedsgroup_koen:
        user    => "ebayclassifiedsgroup",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEA2BNYw6ZZI1KSZ/3cL/KqewqF8OVnYiAHTOQjzoUc8wWgEChoyDsGcK22OUN2OnLaI0i5aQftwyNSuyQUtCgrQis0AHtkdfINE2hOmCzjnNsJrb+vR9+6vdV0joz4nn3EVEzrLWvsmYlI6lm/Bi23XzddF31/izaspbp73+cs6gV76mxDBwfkGYyInwU2hxsAZdGHZ5fXime7V3fBwep1sXceFBMEyKuplyhfEZ1InV6Am1MUyRQcTLUj5bdnDq9dD28G2lP5ttGXP1Ve8VuoauNwbLMCMGWPs3HdvYcpMH0jc39Ce8DV3MvRcYaYxuaFeUFRcDdPOTD+/0x/2SAKtw==",
        name    => "kvdhulst-ebayclassifiedsgroup",
        type    => "ssh-rsa",
    }

##### EINDE ebayclassifiedsgroup #####

##### BEGIN evertjenetworks #####

    add_user { evertjenetworks:
        email   => "evert@vanharten.nu",
        uid     => "5020",
        groups  => ['ring-users'],
    }

    add_ssh_key { evertjenetworks_evert:
        user    => "evertjenetworks",
        key     => "AAAAB3NzaC1kc3MAAACBAMg580Z4SL2KWtPNeicc/Zhiwqrd3iNAeAIl3mXosTEI+CvinILL7+e7VasJhhxi+6gPPu4QPdROeRHwVESMFCjYYU0c9kfU8Da2RnZpZGnzRicGw8QD5jxNTUw7SVLN0zzpFwufHLMW8OM0Yv8fScGjwcepRvmRITyxKNv98mM1AAAAFQCDh0IVU9ta32oQu0d99IH96AeXLQAAAIEAtqGVhCHqezk+aPfW1wYLZzv0OgND6hFjeO73hC09oxBRlgFBxEAyjz//pV4afFBjuXXd7M6HrWdBMs/toTnWpYugHE8fMl156fVw0sjWW2Qsdwtv646Axauo+LPAxBXg6Eb3614015FwMQz3MoKdgphCJXHGNZXW+xtar96GJ3YAAACBALteS4ciNfuvHAN8qIEkvX6fNVgcQVkpfpfX4Ywt70o5m1Wd/6gb855dXw4A/Zy8m0oYadbE0KyGJVZ+XMWxyTVwjrwge3wPJ/M8aKkLI038Hl7TTzzYbJoZ5L1KZmeR6Vzy0u3bw/YpAXSG3f+Zfir3J+KZpFSUIih0K5MrpeBM",
        type    => "ssh-dss",
        name    => "evharten@macbook-pro-van-evert-van-harten.local",
    }

##### EINDE evertjenetworks #####

##### BEGIN is #####

    add_user { is:
        email   => "netwerk@is.nl",
        uid     => "5021",
        groups  => ['ring-users'],
    }

    add_ssh_key { is_ssh_1:
        user => "is",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAABIwAABAEA1LcP280wU3pX/0+gjhm7VYM9Zd3t6yg44+vq8eEp3Eku1Z2I3AUUqwQgWM1IJIFIcnexNR5VWaRsUDaJvfh+XmEzO2eJIqSxbIh2zBp/8+QMr7wq0HDzqwfWgk2wL9L1bMwR4ma/qEHZUJcNVKiI+xXbTjGfRrU9ATpNx5Rh7tS2HunYrsU7m4a1SHUk1MKjxXI0/NAG9vJJ7oyQ1LLq4cZP9BG1vwyfKYHSNgdMJvrOd+9/BjbgX1EJ5E14l3f7c700TuPSPV5x5QW+KbP74GG0/OhIvheHtRf8Zi/N3LcKRNtejbO+hctFhgWu6kp1ZqXHVJXWej5Yir5OEuf1OaRRCVyFWgoSWzQB4T3XPpjvuO3OljC2mQ5yxfWNOKqqxN3B9n13uBMo36I++RlDFkwHdJy50xMbWuTMGNTURrB0dSa6uYY5v0qw4BInXuAOIlrqdqNSPAMuQkHuHIArTYX6BoVE/6/WClYN+6CQ4u87RKtfnl1Hyuu7QEvfh5eolxz4FxpXCykv/dMPkwjV3JUIzZIEzLxqF5QA5Lofmd25TYocjMxvNGoe0hA5c8q1EjN/ll7R4rVn97Db/CbKqe+pY0ZZlFCYbdwCI/Tfzdph93CZjxtLAcLiCLDBi1ppV1m6BDztStBih50nNAe+Ivet+mVJ4bENuqBer0kO+oGTQPkYii3lzS7IfBuLZP99i2V0fkLsFYYYbrWDqESAwM9bUmw77IIjWZfRixrw6Z/cyRGD0lXLcrM0Ch8MJ9bE2TjFW5juvqQ1TITYRtWPAF3M4HmqXIYvpFovdsD3rm3+/9h3c1vQaDjmTbpO1pEOBdEleIRn4Ni0OUrgLmJwcjbNgl8bqpPTDJCPKBJchX3DVDlrJ6qYk+EZ1SyhOg+sZquoLZiRz6IIn3j70m4yH3EPYBZfwusKPZjNKrDHIxZ36UKS9hHQrCVfeP1KtJMZi3rjVC1s5me59Uc9V2DC3y+DYImWY2wcWw9gYgCNiJKRQJl4ESbSvEhq37mNH9sVMQCUJeuGv2xx8Rozrb+O9D4Jhe/GjixfeSkFMVFkfBLqyuRDJugLDA7BLdbwOKYf0xZtZ4neyxc2Kw6Il3jY26MHVxYqoqv2y6RgnzHJXdGZr+16oIWf6wWxLwmEk/kkO4namcZbJLMqlNegwt8grMPiIjLNXIa+42/pLwy07naHEUBr2OsO7fD4PokDYFKySB4NVMUU9CTTTF/eloTW2XGnO39N1k8NtGkQkffhyI9HqbuCvD8U0FdwSxFDajf3MIGBC+kL2pKQnCNRH7oJ/5oj0FkFTMO6kl8jJFLdj51Q7hf8X9oACPKmCGOK8ddc3AM0WyMkYW0OLPqIfOwRew==",
        name => "admpins04@shell01.pinshosting.dir",
    }      
    add_ssh_key { is_ssh_2:
        user => "is",
        type => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAJu4y0R5kVef0voCJv9/9EL9ZO2TvKLD7HZRQfG8x2kxfd+NfUPQ8HKCTibE3CQQrSoZdH6m/y4c6LMMyGIjHAa7p1dX0sdse5ggQ2yfttQe5xTJb9HKhAH6XZBNGc07qCLnC3VkM7d15Bey8Y+/ZBP8++peu0dpiLJrcy9697WHAAAAFQDk8XIJV79MtatOi/iFKmVk2EwVxwAAAIAPOFq4vmckZcwGDia4o8cXc7KY3GY15oSGnQBtIA8XBo/wu0EKgjmFNOGMckwn4Yz82HYw/HVG0YWR6vEjE7j5cHJfOqAYJGKEd+XAl/CILdlKqLMNmOK5G9tdjmWhsKO2dDFXwVau1t8Mb2ib+4+FZGf7+ueasn62lTBhtaXToAAAAIAmRAtj9dM9IBzN4qx0N7VMqtyhqK3lwwm6fvAensrt+vKKvoCdgchXJ6hI+ZFolka6Xs2Oo6CutzC4mneHt8BYOWFEuiImdzuBkyvYPCTLVZtW51O84BHv6BaMHCUYzymn+EjvnuY/bigaG56GRuX/B4h338qq6Kq7WHdt9elOCA==",
        name => "matthijs@is.nl",
    }      
    add_ssh_key { is_ssh_3:
        user => "is",
        type => "ssh-dss",
        key => "AAAAB3NzaC1kc3MAAACBAKY4DvmUZi75w1EY4DyL0K9tnjoDOX8iZatRe4CEQqHQhVnwm86SkfGxW9Ng/tZnaxtC/cwUA4z5yIeGIZTwhsku1zCSG8wffirdTxpcvW4GngDEbZKnfPpsMxdmH2ZteNCaZbtfM8SCp7htTcgwlTCFtBdH3sj94zL/m+ysKiVZAAAAFQDVjMM2nB1e1sfuCBUIsZnX81YT7wAAAIBADnR2tvd+X9FJWmnU4vUtFxQEL+A+zRhtwqaCOy6iLHm/GSubysev9FiAzXMM2XrrqTa0O7t9WvKsaBHUMZ5DHJBvMRaiMSVw8u1Ab4W7eM0SK/z21Bf68SNR4AnbYFKJBq+eE5LQxW01+/FAwBuv4Vo6IGaR1zBP3StyOXk4wwAAAIBuEWoWhOMX18cs42b/dQgdTLhSi+TioRE2UUhvRgDG0lyqGHYcVF140YreaLBfpvJS77T1MmLxC/Xhuds/yf5l6r7mLmAptFeo4KvT8GbZQE3OeHkRj8iD2Ikhq702R48kJc2Lik6di7vLQ7UUrPNUtCqcPHna1mXqOHgGGc350Q==",
        name => "matthijs@ls-la.nl",
    } 

##### EINDE is #####

##### BEGIN surfnet #####

    add_user { surfnet:
        email   => "surf-ring@prolocation.eu",
        uid     => "5022",
        groups  => ['ring-users'],
    }

    add_ssh_key { surfnet_prolokey:
        user    => "surfnet",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC+V1P5j1f5fcETEuGQWB+t7K58Q2LCA896JFN3AIWrM0cUwh9UgFGIqKe85WSdu+IoShXbyOR3JgW2hEskTsVuAulRaXOvmFQGM/Hg6QJVEn7Y8uvYLHx/1j+XEvVpTuA91c8ZR6VSH6RaiA7EYwGCZkIpfOYPpysHAC7bODM7Nkhev3ONV58fgoawC9ywYJMEhKNhPgkrTOFMLuLHnSTd4ynfmFuALAN8E4jHZ0vTcydV0GAtPfJWOpeg1Na4TArullroA7G64EYuVY5pE5Bn1JK/AEgpksBZGtOs3YhG+sa+wVsqf5UUIKZPBZFOf80xWQ9ZclRW2W9pnU3+hwg7",
        type    => "ssh-rsa",
        name    => "prolo@surfnet01.ring.nlnog.net",
    }

##### EINDE surfnet #####

##### BEGIN prolocation #####

    add_user { prolocation:
        email   => "cedric@prolocation.net",
        uid     => "5023",
        groups  => ['ring-users'],
    }

    add_ssh_key { prolocation_sshkey:
        user    => "prolocation",
        type    => "ssh-rsa",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDRNcgktqQ9WEYDV/kYEV7WuTpxYyZDNt/jEQ8im/j9J1jh/nX/fAQw5XT3yz0kIDOS+vBanewOwLk5c3ZGt4vYYHzV2lT6OvPuzW2RyW23DbGB4ZdUeCD92HfO/aDhQ17jZtaSx/DmhBnxFIqHxvKfBkS7zMlPxiSQCLZbt74RdBZFhosaFfb5aLe5MIBTCP7Cqcq8o6o93rXyQjvnSxuBEZZ2T/KQxbtji2GTF2ll98LkUsA6xSC4Uk9Jm/towZJ6zb6ozBQqsnZuncl27QBGXFfYjryEcQvMW506tYopThbJx5k0DDucrIXZ7F4qOHATosY5vgq0hvq+IHY4oFN9",
        name    => "prolo@prolocation01.ring.nlnog.net",
    }

##### EINDE prolocation #####

##### BEGIN in2ip #####

    add_user { in2ip:
        email   => "noc@in2ip.nl",
        uid     => "5024",
        groups  => ['ring-users'],
    }

    add_ssh_key { in2ip_dirkjan:
        user    => "in2ip",
        type    => "ssh-rsa",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCrDK+oklbpw27vY28Jr8qmxAgiZy386qHSndxCjNdkMh4svm7qde6Caw4pbh4nH8aC5+jB0LoHatCwM5NG64tT8OqG66+VcyXKDD76+nvX24chI/Jv+S1rri+KkFjQ1umWWJ7gu4G2qYvVjVtqcgJU0EpbS2Mr5JxGCSt6sWZSOwGBwfcgVSs0X0+IwCifiTtN2sVphMPvi74qwEx9CeyKcuAm0xm19aB2GyOnpBtLAzc9ZCMU8ne7gY3liH9n4ARw+z0M9U0fAlYr8FG0VuAsR/8I5SxIg1CR4aFQwa4TjVQ30m3OpvszkRj3kUk5bitp98RRTcz2LksbJjZ+mLHH",
        name    => "dirkjan@nmc",
    }

##### EINDE in2ip #####

}
