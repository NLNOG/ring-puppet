#!/bin/sh

REPOROOT=$(git rev-parse --show-toplevel)
export REPOROOT

case $(uname -s) in
	(Darwin)
		: ${TAR:=gnutar}
		: ${AWK:=gawk}
		;;
	(*)
		: ${TAR:=tar}
		: ${AWK:=awk}
		;;
esac

: ${RPMBUILD:=rpmbuild}

case $(uname -s) in
	# These defaults assume tools installed
	# via MacPorts.
	(Darwin)	TAR=${TAR:-gnutar}
			AWK=${AWK:-gawk}
			;;
esac

apply_template () {
	(
	trap 'rm -f $tempfile' EXIT QUIT INT TERM
	tempfile=$(mktemp $(pwd)/templateXXXXXX)
	echo 'cat <<END_TEMPLATE' > $tempfile
	cat $1 >> $tempfile
	echo END_TEMPLATE >> $tempfile

	. $tempfile
	)
}

git2changelog () {
	# Build an RPM-style changelog from git history.
	git log -20 --pretty="format:DATE:%ct %cn <%ce> %h%n%n%s%n" $1 |
	$AWK '
		BEGIN {
			print "%changelog"
		}

		/^DATE:/ {
		split($1, date, ":")
		$1=""
		print strftime("* %a %b %d %Y", date[2]),$0
		next
		}

		! /^DATE:/ {print}
	' >> $2
}

die () {
	echo "$0: ERROR: $1" >&2
	exit ${2:-1}
}

cd_repo_root () {
	cd $REPOROOT || die "Failed to change to top level of repositoroy."
}

