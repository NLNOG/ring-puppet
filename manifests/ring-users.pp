class ring_users {

    add_user { intouch:
        email    => "tech@intouch.eu",
        uid      => 5001,
        groups  => ['ring-users']
    }
    add_ssh_key { intouch:
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEAxr0qjSn+2nhibydQhc/Ry4KiChKv9OJBja69s0ScyNTwWhvWvEItgXQlbLp0RW5XeZ7aBvehHa3pYLPZUshhz5roRMhZHZhKe9Cu12ZSS7qIXk1DRL8vTDP2K9f+yyH04yDlIr2O9uyh/B3KCcK1TdGVDsj/KiXgDQSClfQnFdqByYqFftEnjAq86eoADhIWnEbH06HE2ndEtnggtOJcy0D7SC1O0Y3MxqpJy8oEHMsrVoFi+Do+bc6iqW39Yi20t92I/qKz08wHrOEqNSsL0OMi302GJ9ZozhJXHIUCdvMMgUlufI41lbhXpeq8Kau/eZAdgC3CcqE1nsL19mOSfw==",
        name    => "tt@intouch.eu",
        type    => "ssh-rsa"
    }
    
    add_user { bit:
        email    => "teun@teun.tv",
        uid      => 5002,
        groups   => ['ring-users']
    }
    add_ssh_key { bit:
        key     => "AAAAB3NzaC1kc3MAAAEBALy1k8K73RbXIfmdwdPkK4/d5JzLoSDo2kst9vElxK2+2TfiEq2KipYGH1pYwlNsbNWwrjYDzdrIUK92D3h0AoalDySxdOWEA4n2CoLTOIV93+4mCoYkkxMMsD1S1TERSqbSX1m51h2L7O8bLz/8DjpLGzCAH19egMQR6Ca4JzTDKA3lJojAfQ+7rJEkq72oIMXCKBaHrnRaaf+nOuwIG1GPkcnBsCKC/g9L3yNZJuIoB+Wl1lP98iEz+RZDGT5MltVWosBxM2UcmMwiI2oznl/HKwTZbW85mhQzs9OVUib4cFzvS7vYa36khvD19/ZPnfXj2zzK3C2BTb6udBIor7MAAAAVAIDv35RBXwhkIGjxVr5jRUAl6z2pAAAA/zrkj7qv64bKnyDa398/xgEDWEw26vlw2QeJLTo11gJAG4cg0DFqSeJfbclJLPv5C+vSP7es5to8tZLkkmNXpZx1Fv1we+yBUJ6Z1QtZ4hd8rh4mx82Z4oGqh4w6kt1moCk8BAMKifC51diw6xZOgpU7zXmymgCLExhyb/UEL+EUVglnl/YEPqszd/8M7OD/FPMcnLFbh7MvVZJorJfNO0ZKITaZSFCzR9aiHfYyPfg+npxjQrCBLCDyoQ+GxidZPVX86pwUHmwg7tb9EtnFQIYSJLRlw3x5Fl7zSKxLUt6ODieSpkSQAdDY6Y9rf5tk0NahY3vGfTWAxTZrDjdJiQAAAQBurz0Bq43YoAMPRh0aQ54jIEYE9dOdXo4Q9kH4ARaKMiE1cGaytLfeAJcomYsnjn5O26Q8R2JByBU7sSCzVFKZtGpQJWfksO3fY9XLu0KmEtXhxYph1xjDXymb2aoTvci0pOB6XoFDpz4o6JhsjD/MmX91EupWOoPNMG1Q3ROM3t83xSLXDZGUm8E4modjEOayhjEl2jsEpZc1RyTitrOM05uwtnK2VDUgzn6GqE7QnJC7BriQiRX8rzdn5vaT6AAzn9YoHZhl+c9y4xN8nE3OgCToJgGwDM4tKRrmUpNDyBPU5Q2kW853VfdFklgDqA06tNLllHMWMpvsxI7urtfF",
        name    => "teun@moridin",
        type    => "ssh-dss"
    }

    add_user { coloclue:
        email   => "routers@coloclue.net",
        uid     => 5003,
        groups  => ['ring-users']
    }
    add_ssh_key { coloclue:
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEA3gqVHURqyVTzzjUjgMXeCJfUi1VtLnUqIr166az2wNUTgnuxLLLsa1evPz7mfDJwY36UKi5IcUuC9pf1B9q2vD6o1fLrrd4sviGQZsvSrGuJkMEvIhXM8JtKxpwbEgg/3vCPPUV4cfjBqeNJeo2r6vru6oOHOdFuGJO5vDtDG/EmuQVgMirTWvjlONKWqEGxz/5BTnDX8PGZ5dEryAdtXrhvf1wYqWcQCkh+ZSgBqq7Vv4Chfzeo7P2iIPi4SAoz6j3pDRNQDzPu2r1cMDPqZCPeTVR0+P6+NpIVo5xlxops6NsJPEwxYhhMYc9OsNvR58JII6G5Z2T2/0LZFeVmEQ==",
        name    => "weerd@weirdnet.nl",
        type    => "ssh-rsa"
    }

    add_user { widexs:
        email    => "noc@widexs.nl",
        uid      => 5004,
        groups   => ['ring-users']
    }
    add_ssh_key { widexs:
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAgEAk8OfxbPvTG5y9tFuhVOHcjomRewB92D8zN67mpX2/Nh4t0wyJINuu4oHDuJE+FVsULDR4NpwifyxaYaNE8uNPrIiqmjrYcnmhMxDcNk5S6PLJ/0klslzbnJ/KZO6aXGVvZF3/JtiKFktkBqBKtrOrYAFDuFEZUTMO8a5xpHp1W03R7sYw954fLiZaWLf4tYYzmVAwqP0EuBxw6qLgMZNEymlqCCIDdQRx3gxGpHWh3owY5H6OwBq3OGZuKYMMpD2GRC1+SQZcQpycTPF3HsSWHYwEmLmmy/HSRBF1/svt7dYnwqZg0c86yHk2mcVf/jSZ7lAo5pgXMFEQcAs+8uLlK2Ru9aOYzxeqtnee8uDhFyfnjjwCXWXb6d8eICNsO3CPrYyIcm33Zs2ez2VF13EaT9ZbmlFBcn6D6fThUj0Ea7iP74hCgLd4W5s8z5wX+Zx8nVmKiKtMmJU5YQaXL/z9XQ4SzRnB0yuMjl4F9/z3hnWzavj5sSrMdoxK/S6t/WmETUSJf8Oq4TyLBd6GFggn7drrUr0EAREk/tXwakOG+zLfZuZOIxu/7fU2uOdgYJ5/U6UBHqHhjVp6DdrMCnXYn+vvvnpAhiJNm9pY8QTpNj54Nkki9ET6CWv3ZPMS1QEq1z3vgZxFMQm9+OIbhqcQF1r9t6ZMT325GfWe/m2zHU=",
        name    => "wouter@widexs",
        type    => "ssh-rsa"
    }

    add_user { xlshosting:
        email    => "peter@xlshosting.nl",
        uid      => 5005,
        groups   => ['ring-users']
    }
    add_ssh_key { xlshosting:
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAgEAzZcxnNSBqocQVE830nX4k8Mx3LNDFvOsDWezhon5zy8LKu09nACOnQYPTqGAADqDr5lrq8X9Hme0RKrThltMrihugR4yw8kTVl7C/ISazdlzn0EnaZpQ+H3bgbvzp9Ba5WmpPGx7b/YKROEZeADfga3TEARhj5ZsFutuerQE4LVpVc8iXQwjTVziHCPH/ezKyGa4CmH707qQTRMTFQW/bEcvlUqk+0KJTGKBaiPXZ9vVODDTjmgStiDkc3Rn4il6ifGlWBakm4ky6Md26cGzQWli8ABWOGswpunPNboNEgmQsuI7ifVA/OO73UNucho1g1FNT+33AfhCK9o6Vpztx3seun7rbGMNrv7y4ROe63yh8PeUbF3Sf0GdyB1KmCL+qFMaVOAuKnSzxpsBMUFycXdncrUmVXzdrzb1aXRhE9+FascA5KG6dGirhxgl7Jxk1P9TWtav/swAkJN54JwLM99a8T8EOC7N651y1sNZ32gDrOsXVIIxDArRoj084ZCnLxYScoXUw9qqZStTL/a90O5CTkl4jV6T+OwftHAnqmtrgHlc7vkOFbkGfB0QPu+Wzl0+mTZus9csrvzGAeSpUJXgDniL7Bebd3fWpEaYnB2UViAV7D2U259mMHmrmcAh3BZiZQBMoeDSo2l7Kwi4To0dKa8T/bq4XJwBRgpODGE=",
        name    => "root@jumphost.xlshosting.nl",
        type    => "ssh-rsa"
    }

    add_user { interconnect:
        email    => "noc@interconnect.nl",
        uid      => 5006,
        groups   => ['ring-users']
    }
    add_ssh_key { interconnect:
        key     => "AAAAB3NzaC1kc3MAAACBAL/dFf7qvalf0XqAm8bAB7/VtQEbMxzMHyQV9682MXiin3/k0XWwFplg0+Eem7cyFNyLW8N3I8xsLFgrBzaH0W8OtfeW3/Vp6tVsBkSL/11mZWdon4ZQSl8gBqFcaiprqD1LaQhYvRdCQA0hvzRIOe9MxHK1rmUQPHYS1RCmWzcPAAAAFQDo38eE3Vhd2+ZFDui8AN8o1pZw7wAAAIEAk7bh+NAU0TN+ktgnLl5oDTcGcoxdm7pjlfcY0FQoYfLNLk3fWU0SMqdAjkp3Mdg4b68slJxG6usjqvbFydVTRYbBXIQBkrseG73DQA63LNmrQIA1kz3DdqUi8vqZtX+QVLrNb8pt/0NVmSvUc3EAAx7N7BgKdTGOJNoATsrPdEkAAACAYLLpo4BH4Huf3QmFC6D91nkQh1m3EwgyDxHx2mD+NoeQUlnl4/rzhhTqQ3wFtgd9ia+86bFr4wIN4f0TFjgXd6Mcdhn7swQMT5fttfvhgrb/bD6kDSE+8PZrfExgUEhw6plPvLi22tCBgAJ+Jfao5dmz9IWMU/G1RIJSyXAKtOw=",
        name    => "interconnect@pjotr.interconnect.nl",
        type    => "ssh-dss"
    }

    add_user { cambrium:
        email    => "noc@cambrium.nl",
        uid      => 5007,
        groups   => ['ring-users']
    }
    add_ssh_key { cambrium:
        key     => "AAAAB3NzaC1kc3MAAACBANnnPEOmV/40/HvwU+Xr5kkEF2CtJ15ZlYFfFDYqPSxEvXKwdUW4LL++SWj9YTi6sEEppH1t/0oSLwq/RXs6uey1pBnDMcikLIPuF5xmh3dc1yr38cLefD/1VfncXIfBpajjzb5gyhvGAMwCednKttOS6HMFYhj4XK8x7XF3R1dNAAAAFQDWRIJVFVQr9Rizit+exU3uH0ZWuwAAAIBXVZNjdibQ0blGrsNAH/pz2yPvtRZDFlUHHkLlT41pj+JitoIW/zPrBcELTRl3Bn9hPrMhs+arfT7wPMCwtUhu9RM23H0AY8A6iWMd+MAjyuRVnbKm/t5UY+9OeSGmhY0VmSd1VmgtL1WFW2Z8JruDU+SKobBs+FAnAPOVyetXogAAAIBu3pU9tLu7VZh96MqTYAOsnhkFdhcSemgQDtgWhvWN4sOah+g2i0VuqPC2G2bRpiiJO2Zu6Y6OguA46Ie6l1PCcm1I799vqe5545JKUGi3rS50lX3udH5j68twbvSTpniTMQzaGUdKB67rWBsSABKawWc75f1ifJa1eUdHxfoQxg==",
        name    => "cambrium@cambrium01.ring.nlnog.net",
        type    => "ssh-dss"
    }

    add_user { zylon:
        email    => "smite@zylon.net",
        uid      => 5008,
        groups   => ['ring-users']
    }
    add_ssh_key { zylon:
        key     => "AAAAB3NzaC1kc3MAAACBAKfdyrV1X4PvcSvGKFW9sMSLXqGzaUOrQFQIAceg/tl+GZKkL8EPMSLW19aoORupsuJhQMIv4Qqe2oFITl12R6AUnzbcTb65B+YK/3dpMmzBce5IpADUdTyLVzQSiGUF5gsfw8C79fLAkgBi6JXwbVDewzqnQ17XX1qc11R0sMZNAAAAFQCWZNFJhB4e+ml9KI7d2XEVrMR3oQAAAIBuPk7yGJc4tgoCZKcQUUiXDS9jyv9YuNUkvCWKBtzgJjcRmtrF4b5ntOqI6mEnuMGUBznzFcGI9mCUQHnfb/kpLL6QSzcLpTCfNXHTevA1aeG3hrIEXnYvbh2R4IpXPjp6kN1/HUfJLHYzn4svfXXZ921cmoa7iT86M4/TWKH0kwAAAIA/IYO8R6PA1B42uqiSNVbklvrecua1hKexlG7JO0WitowKQVmArKe9o8uO+2ri7k5DXGlPLNpoc3OqEWo8GOG3YMtQjEW2MUblBVlAMN7bFLj+DZSqBrEdiFZnZ/azElpH08m+ojMI0yzObGqhrnEodCkYDYi5LgVXXrOMiMFnmQ==",
        name    => "smite@zylon.net",
        type    => "ssh-dss"
    }

    add_user { duocast:
        email   => "noc@duocast.net",
        uid     => 5009,
        groups  => ['ring-users']
    }
    add_ssh_key { duocast:
        key     => "AAAAB3NzaC1yc2EAAAABJQAAAIEAghMY9EavxopexZ0HhJvzDYBdIvcf4iBPzvfLrYshuF4keakyugfQ6mob2qlssVIAztJRrQfUDtgvNGKxOFrCzV9vXwf5bJUbCPbUIoSQTdoSBzwl31Q6dHpYBc5jQ5Xmez8wcc0dtxdMun+/eVOVG+ErghC8jpoCVQrwu5ikc2E=",
        name    => "fabian@fabian.office.duocast.nl",
        type    => "ssh-rsa"
    }

    add_user { easyhosting:
        email   => "systeembeheer@easyhosting.nl",
        uid     => 5010,
        groups  => ['ring-users']
    }
    add_ssh_key { easyhosting:
        key     => "AAAAB3NzaC1kc3MAAACBALEAhT8vTvMAkAj+Uk0PrGh13BBWDzWlJs8vuWf5xK/7KF5sR2VHKBYmOJ67pGtRc5i+NOkhj8sWjvF3uyVupwTUICUqTpeBLI5R/P/jB5lUeiYVZF3HzV+gDSIalijjY7yZrP35CviZvuyP5Ntr+eSFNCkgqcAKZpphmDHPAASDAAAAFQC5GbXzD7xPYH0kI7+hOjyoSBdW+QAAAIEAgAAI4tMDOkDlfJCbQfDjPMcHsGN7HNxpz9obx1cbJdZOBOGd3fWsYlQmOO/NBvVDRuaQ/JRXzvxP9BKtf7TEu7icWU4Q6PECR7Z4NpgWX2amVuMy2ol0Bs2bcnbM3UHa06IgLX17KaE+Jor0utr9SHMPFClS2doKsTnuuzRQZFoAAACAMiWkNW7j//w3kih64KBvnozjrvDGj5hVyvMq7PZEjwhe2+vx8ErY+af4SnP/a3j1wyTLwMMxDr2+c7143ZRBil5Fmgr9YuPe3OQyx/zZ2AJmCQiWQiZ1EDvMFPl4gcD8XWH6RG+zs21uGLwSShthWUMclTULBIZqUbMA80bJdx0=",
        name    => "systeembeheer@easyhosting.nl",
        type    => "ssh-dss"
    }

    add_user { previder:
        email   => "noc@previder.net",
        uid     => 5011,
        groups  => ['ring-users']
    }
    add_ssh_key { previder:
        key     => "AAAAB3NzaC1kc3MAAACBAOmrANjEYNBp3+yxYd6T/x0Pe45kAKfQ/rnM256Vd1ytV6LbbHUXPizQjVy/40rA7Vem/uux+9Cw42IX2ss62TFx2JSbQVcp3HxPvW/FXd55r2kSVvARI35OYUWU6KQWH3f8zrFvDtMTkpK/GiB1hB8WJIMMtZZP64r5zyqsi5abAAAAFQDoRLfZtdES20c6SCYHGOtEn1ZVPQAAAIEAr8hFL7oZCs8JRTzVJtW6qp9h/j1cFlTFHDACRy3dN8VWIJUt5+PQss9xfD+0ACobqOo6N41qxvWE6JEfchd0Aeqwx2Jie70eorj7uJKUTjVDFGx5S7T5ZRq3czXlfckzo/xRI5l0nN3kt09wp4G1zXiBmPiK+GwVF06uHSbJelIAAACAXxiOe9j62EgoxRgregDNp32s5lxVFbSGqpsxLOsddMBOB98pa50NluvZEaUwRLv8kK6+YgT4WI/q3DcWwEVXY/ZUP0IDpUmtA8PUQyouy2lBWik746GqN+Re8b5NjO6OwuNfH8bTb1HllFzc339O8+KOHN11t10VMyXzEIo1sk4=",
        name    => "robin@previder.net",
        type    => "ssh-dss"
    }
    add_user { leaseweb:
        email   => "noc@leaseweb.com",
        uid     => 5012,
        groups  => ['ring-users']
    }
    add_ssh_key { leaseweb:
        key     => "AAAAB3NzaC1kc3MAAACBAKrXxLnA6hi7ppZZHOwILVmMmG02n8tRGdgHXxuhYgyEoaEAVJrBPvdziYGSc1MLSXlXtmm+XL8uDMQTnqwb3YZiKKW8v65Se35GdWr1Uf3Gk2jF/M7lq6zR2ji/d7iFq5zUHSEWGOYDz73feDNhJu568k5j/WLSxaV0m9Z7lsdTAAAAFQCeSCQTuWFZVtQYezeFDwDpOf0OlwAAAIB/AlZANZgGYBIsruBaYXseU1jfHm4e5xNGJBmFUtrqLgi09xq+kYpCQITCpPd6eE3MLJ2JylW/o3tlREtvDU/oZDnfG8DgVIz2rtjQ7RkeVH0Wh60CrXn9wV01s/5ih9ISO6ECMV4vr3KWX9XgmQFG91YqXTdcnmHwuYZUeQLQ0AAAAIA4h0zTpnycHcmW2Bfwkor0X2mHdNSZad3+wEx3Bf4DE8VpXMNbJcYgyZ0STbvmGwyAnLZ78qe0+Id0ywkTRXtFd7GNoI02qMnQgBfgZDCcwxHxlcG4v9iI/arCCMGibIWf1Fzog/TYGiJIPExB5WE7G0G3U9jKnxQh3zxG2vtUHA==",
        name    => "bas@louise.frogerstraat.nl",
        type    => "ssh-dss"
    }
}

