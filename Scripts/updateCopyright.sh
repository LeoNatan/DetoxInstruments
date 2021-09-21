#!/bin/bash -e

git grep -l -E "(\/\/  Copyright © )([0-9]*(\s*-\s*[0-9]+){0,1})( Wix\. All rights reserved\.)" | while read -r FILE ; do
	YEAR=`date +'%Y'`
	sed -i '' -E "s/(\/\/  Copyright © )([0-9]*(\s*-\s*[0-9]+){0,1})( Wix\. All rights reserved\.)/\/\/  Copyright © 2017-$YEAR Leo Natan\. All rights reserved\./" "${FILE}"
done

git grep -l -E "Created by Leo Natan \(Wix\)" | while read -r FILE ; do
	YEAR=`date +'%Y'`
	sed -i '' -E "s/Created by Leo Natan \(Wix\)/Created by Leo Natan/" "${FILE}"
done