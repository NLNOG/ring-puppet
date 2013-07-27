class ring::apt {
    include apt
    
    apt::source { "ubuntu_archiv_precise":
        location        => "mirror://mirrors.ubuntu.com/mirrors.txt"
        release         => "precise",
        repos           => "main restricted universe multiverse",
        include_src     => false
    }

    apt::source { "ubuntu_archiv_precise-updates":
        location        => "mirror://mirrors.ubuntu.com/mirrors.txt"
        release         => "precise-updates",
        repos           => "main restricted universe multiverse",
        include_src     => false
    }

    apt::source { "ubuntu_archiv_precise-security":
        location        => "mirror://mirrors.ubuntu.com/mirrors.txt",
        release         => "precise-security",
        repos           => "main restricted universe multiverse",
        include_src     => false
    }
}


