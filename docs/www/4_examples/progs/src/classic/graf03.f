C (C) Copyright 1996-2016 ECMWF.
C 
C This software is licensed under the terms of the Apache Licence Version 2.0
C which can be obtained at http://www.apache.org/licenses/LICENSE-2.0. 
C In applying this licence, ECMWF does not waive the privileges and immunities 
C granted to it by virtue of its status as an intergovernmental organisation nor
C does it submit to any jurisdiction.
C

	PROGRAM GRAF03
C
C	THIS PROGRAM DEMONSTRATES MAGICS GRAPH PLOTTING FACILITIES.
C	THERE ARE TWO FEATURES DEMONSTRATED:

C	(1) AUTOMATIC AXIS SYSTEM
C	(2) CURVES ON MAPS
C
C	OPEN MAGICS
C
	CALL POPEN
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PS_FILE_NAME','graf03.ps')
C
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','TESTS/GRAF03')
C
C	CURVE PLOTTING WITH AUTOMATIC AXIS SYSTEM           
C
	CALL GRAF03_ONE
	CALL PNEW ('PAGE')
C
C	CURVE PLOTTING ON MAP                               
C
	CALL GRAF03_TWO
	CALL PCLOSE
	STOP
	END
	SUBROUTINE GRAF03_ONE
C
C	THIS ROUTINE DEMONSTRATES THE PLOTTING OF CURVES ON AN
C	AUTOMATICALLY GENERATED AXIS SYSTEM
C
C	THE AXIS SYSTEM IS GENERATED FROM THE VALUES OF THE GRAPH
C	INPUT X/Y VALUES
C
	DIMENSION XVAL(10),YVAL(10)
	DATA YVAL /5.0,8.,10.,21.,25.,33.,23.,12.,3.,10./
	DATA XVAL /-10.0,-8.,0.,5.,15.,20.,15.,22.,28.,35./
C
C	SET CURVE VALUES BUT NO AXIS SETUP    
C
	CALL PSETC ('GRAPH_TYPE','CURVE')
	CALL PSETC ('SUBPAGE_MAP_PROJECTION','NONE')
	CALL PSET1R ('GRAPH_CURVE_X_VALUES',XVAL,10)     
	CALL PSET1R ('GRAPH_CURVE_Y_VALUES',YVAL,10)     
	CALL PSETI ('GRAPH_LINE_THICKNESS',2)          
	CALL PSETC ('GRAPH_LINE_COLOUR','RED')        
	CALL PGRAPH
C
C	GENERATE TEXT FOR TITLE
C
	CALL PSETC ('TEXT_JUSTIFICATION','CENTRE')
	CALL PSETC ('TEXT_LINE_1',
     1'GRAPH Plotting - Example of Automatic Axis for Curves')
	CALL PTEXT
	RETURN     
	END
	SUBROUTINE GRAF03_TWO
C
C	THIS ROUTINE DEMONSTRATES THE PLOTTING OF CURVES ON MAPS
C
C	THE AXIS SYSTEM IS GENERATED INTERNALLY BY MAGICS FROM
C	THE MAP COORDINATES
C
	DIMENSION XVAL(10),YVAL(10)
	DATA YVAL /45.0,48.,50.,51.,55.,60.,65.,62.,53.,40./
	DATA XVAL /-10.0,-8.,0.,5.,15.,20.,15.,22.,28.,35./
C
C	DEFINE MAP AREA AND PROJECTION
C
	CALL PSETC ('SUBPAGE_MAP_PROJECTION','POLAR_STEREOGRAPHIC')
	CALL PSETC ('SUBPAGE_MAP_AREA_DEFINITION','CENTRE')
	CALL PSETR ('SUBPAGE_MAP_CENTRE_LONGITUDE',5.0)
	CALL PSETR ('SUBPAGE_MAP_CENTRE_LATITUDE',55.0)
	CALL PSETR ('SUBPAGE_MAP_VERTICAL_LONGITUDE',5.0)
	CALL PSETR ('SUBPAGE_MAP_SCALE',30.E6)
C
C	SET UP GRAPH BUT NOT AXIS               
C
	CALL PSETC ('GRAPH_TYPE','CURVE')
	CALL PSETC ('GRAPH_LINE_COLOUR','BLUE')
	CALL PSETC ('GRAPH_POSITION_MODE','GEOGRAPHIC')
	CALL PSET1R ('GRAPH_CURVE_X_VALUES',XVAL,10)     
	CALL PSET1R ('GRAPH_CURVE_Y_VALUES',YVAL,10)     
	CALL PSETI ('GRAPH_LINE_THICKNESS',4)          
	CALL PCOAST
	CALL PGRAPH
C
C	GENERATE TEXT FOR TITLE
C
	CALL PSETC ('TEXT_LINE_1',
     1            'GRAPH Plotting - Example of Curves on Maps ') 
	CALL PTEXT
	RETURN     
	END
