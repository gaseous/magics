C (C) Copyright 1996-2016 ECMWF.
C 
C This software is licensed under the terms of the Apache Licence Version 2.0
C which can be obtained at http://www.apache.org/licenses/LICENSE-2.0. 
C In applying this licence, ECMWF does not waive the privileges and immunities 
C granted to it by virtue of its status as an intergovernmental organisation nor
C does it submit to any jurisdiction.
C

	PROGRAM TEST
       call POPEN
       
      CALL PSETC ('PS_DEVICE','ps_a4')
      CALL PSETC ('PS_FILE_NAME','pie01.ps')
      CALL PSETC ('PAGE_ID_LINE_USER_TEXT','TESTS/PIE01')       
       
       CALL PSETR('SUPER_PAGE_X_LENGTH',21.0)
       CALL PSETR('SUPER_PAGE_Y_LENGTH',29.7)
       CALL PSETR('PAGE_X_LENGTH',21.0)
       CALL PSETR('PAGE_Y_LENGTH',29.7)
       CALL PSETC('SUBPAGE_MAP_PROJECTION','NONE')
       CALL ONE
       CALL PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL TWO
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL THree
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL FOUR
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL FIVE
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL SIX 
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL SEVEN
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL EIGHT
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL NINE
       Call PNEW('PAGE')
       CALL PACT('GET_SPEC','PIE','DEFAULT')
       CALL TEN
       CALL PCLOSE
       STOP
       END
	SUBROUTINE ONE
C
C	Plot Pie Chart in Default position Mode
C
	DIMENSION PNUM(6)
C
C	Define Slice values
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/ 
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETR ('PS_SCALE',0.75)
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE01')
C
C	Define Position of Pie Chart
C
	CALL PSETR ('PIE_X_POSITION',10.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR('PIE_SIZE',12.0)
C
C	Set PIE Chart Slice Values 
C
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6) 
C
C	SET TEXT
C
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart in DEFAULT Position Mode')
C
C	Plot Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 






	SUBROUTINE TWO
C
C	Plot Pie Chart in Default position Mode using Colours
C
	CHARACTER*32 COLS
	DIMENSION PNUM(6), COLS(6)
C
C	Define Slice values and COlours
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN'/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE02')
C
C	Define Position of Pie Chart
C
	CALL PSETR ('PIE_X_POSITION',10.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR ('PIE_SIZE',12.0)
C
C	Set PIE Chart Slice Values and COlours
C
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6) 
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,6) 
C
C	SET TEXT
C
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart in Default Position Mode using Colours')
C
C	Plot Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 







	SUBROUTINE THREE
C
C	Plot Pie Chart With Description Text
C
	CHARACTER*32 COLS, TXT
	DIMENSION PNUM(6), COLS(6), TXT(6)
C
C	Define Slice values, Colours and Text
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN'/
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep'/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE03')
C
C	Define Position of Pie Chart
C
	CALL PSETR ('PIE_X_POSITION',10.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR ('PIE_SIZE',12.0)
C
C	Set PIE Chart Slice Values, COlours and Description Text
C
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6) 
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,6) 
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,6) 
C
C	SET TEXT
C
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart with Description Text')
C
C	Plot Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 

	SUBROUTINE FOUR
C
C	Plot Pie Chart with Percentage Values and Blanked Text Labels
C
	CHARACTER*32 COLS, TXT
	DIMENSION PNUM(6), COLS(6), TXT(6)
C
C	Define Slice values
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/
C
C	Define Colours
C
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN'/
C
C	Define Text Strings
C
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep'/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE04') 
C
C	Define Position of Pie Chart, Slice Values and COlours
C
	CALL PSETR ('PIE_X_POSITION',10.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR ('PIE_SIZE',12.0)
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6) 
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,6) 
C
C	Define Pie Chart Text parameters
C
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,6) 
	CALL PSETC ('PIE_VALUE_TEXT_COMPOSITION','PERCENTAGE')
	CALL PSETC ('PIE_VALUE_TEXT_BLANKING','ON')
C
C	SET TEXT
C
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart with Percentage Values and Blanked Text Labels')
C
C	Plot Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 

	SUBROUTINE FIVE
C
C	Plot Pie Chart with Numbers+Percentage Values and Description Text inside the Pie Chart
C
	CHARACTER*32 COLS, TXT
	DIMENSION PNUM(6), COLS(6), TXT(6)
C
C	Define Slice values
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/
C
C	Define Colours
C
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN'/
C
C	Define Text Strings
C
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep'/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE05')
C
C	Define Position of Pie Chart, Slice Values and Colours
C
	CALL PSETR ('PIE_X_POSITION',10.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR ('PIE_SIZE',12.0)
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6)
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,6) 
C
C	Define Pie Chart Text parameters
C
	CALL PSETC ('PIE_VALUE_TEXT_COMPOSITION','BOTH')
	CALL PSETC ('PIE_VALUE_TEXT_BLANKING','ON')
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,6)
	CALL PSETC ('PIE_DESCRIPTION_TEXT_MODE','INSIDE')
	CALL PSETC ('PIE_DESCRIPTION_TEXT_ORIENTATION','RADIAL')
C
C	SET TEXT
C
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart with Number and Percentage Values'//
     X   ' and Description Text Inside')
C
C	Plot Coastlines, Pie ChartS and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 
	SUBROUTINE SIX
C
C	Pie Chart with Text Format Set, Border ON and Text Colour set
C
	CHARACTER*32 COLS, TXT
	DIMENSION PNUM(6), COLS(6), TXT(6)
C
C	Define Slice values
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/
C
C	Define Colours
C
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN'/
C
C	Define Text Strings
C
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep'/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE06') 
C
C	Define Position of Pie Chart,Slice Values and Colours
C
	CALL PSETR ('PIE_X_POSITION',10.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR ('PIE_SIZE',12.0)
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6) 
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,6) 
C
C	Define Pie Chart Text parameters
C
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,6)
	CALL PSETC ('PIE_DESCRIPTION_TEXT_MODE','INSIDE')
	CALL PSETC ('PIE_VALUE_TEXT_COMPOSITION','BOTH')
	CALL PSETC ('PIE_VALUE_TEXT_FORMAT','(F5.1)')
	CALL PSETC ('PIE_VALUE_TEXT_BORDER','ON')
	CALL PSETC ('PIE_VALUE_TEXT_BLANKING','ON')
	CALL PSETC ('PIE_TEXT_COLOUR','BLACK')
C
C	SET TEXT
C
	CALL PSETI ('TEXT_LINE_COUNT',2)
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart with Number and Percentage Values'//
     X   ' and Description Text Inside')
	CALL PSETC ('TEXT_LINE_2',
     X  'Text Border ON, Text Format set and Text Colour set to BLACK')
C
C	Plot Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 
	SUBROUTINE SEVEN
C
C	Plot Pie Chart with One Cutout Slice
C
	CHARACTER*32 COLS, TXT
	DIMENSION PNUM(6), COLS(6), TXT(6), ICUT(1)
C
C	Define Slice values, Colours, Text and Cutout Numbers
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN'/
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep'/
	DATA ICUT/4/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE07')
C
C	Define Position of Pie Chart
C
	CALL PSETR ('PIE_X_POSITION',10.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR ('PIE_SIZE',10.0)
C
C	Set PIE Chart Slice Values, COlours and Description Text
C
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6) 
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,6) 
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,6) 
	CALL PSETC ('PIE_DESCRIPTION_TEXT_ORIENTATION','RADIAL')
C
C	Slice Number 4 is to be Cut out
C
	CALL PSET1I ('PIE_SLICE_CUTOUT_NUMBERS',ICUT,1) 
C
C	SET TEXT
C
      CALL PSETI('TEXT_LINE_COUNT',2)
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart with One Cutout Slice')
	CALL PSETC ('TEXT_LINE_2',
     X  'Description Text Orientation = RADIAL')
C
C	Plot Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 
	SUBROUTINE EIGHT
C
C	Pie Chart with Multiple Cutout Slices (Including Adjacent Slices)
C
	CHARACTER*32 COLS, TXT
	DIMENSION PNUM(6), COLS(6), TXT(6), ICUT(3)
C
C	Define Slice values, Colours, Text and Cutout Numbers
C
	DATA PNUM/10.0,30.0,50.,40.,100.,25.0/
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN'/
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep'/
	DATA ICUT/1,4,6/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE08')
C
C	Define Position of Pie Chart
C
	CALL PSETR ('PIE_X_POSITION',9.0) 
	CALL PSETR ('PIE_Y_POSITION',15.0)
	CALL PSETR ('PIE_SIZE',10.0)
C
C	Set PIE Chart Slice Values, COlours and Description Text
C
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,6) 
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,6) 
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,6) 
C
C	Slice Number 1,4 and 6 are to be Cut out
C
	CALL PSET1I ('PIE_SLICE_CUTOUT_NUMBERS',ICUT,3) 
C
C	SET TEXT
C
      CALL PSETI('TEXT_LINE_COUNT',1)
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart with Multiple Cutout Slices'//
     X  ' (Including Adjacent Slices)')
C
C	Plot Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 
	SUBROUTINE NINE
C
C	Pie Chart in Axis Mode with Pie Size and Text Height Set
C
	CHARACTER*32 COLS,TXT
	DIMENSION PNUM(10), COLS(10), TXT(10)
C
C	Define Slice values
C
	DATA PNUM/100.0,4.,130.0,2.,150.,40.,5.,100.,25.0,10./ 
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN',
     X  'RED','GREEN','YELLOW','BLUE'/
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep',
     X  'Dribu','Asynop','Aship','Paob'/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE09')
C
C	Define Axis System
C
	CALL PSETC ('SUBPAGE_MAP_PROJECTION','NONE')
	CALL PSETR ('AXIS_MIN_VALUE',1.0)
	CALL PSETR ('AXIS_MAX_VALUE',10.0)
	CALL PAXIS
	CALL PSETC ('AXIS_ORIENTATION','VERTICAL')
	CALL PSETR ('AXIS_MIN_VALUE',0.0)
	CALL PSETR ('AXIS_MAX_VALUE',100.0)
	CALL PAXIS
C
C	Define Position of Pie Chart within Axis System
C
	CALL PSETC ('PIE_POSITION_MODE','AXIS')
	CALL PSETR ('PIE_X_POSITION',5.0) 
	CALL PSETR ('PIE_Y_POSITION',40.0)
	CALL PSETR ('PIE_SIZE',10.0)
C
C	Set PIE Chart Slice Values 
C
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,10)
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,10) 
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,10) 
	CALL PSETC ('PIE_VALUE_TEXT_BLANKING','ON')
	CALL PSETR ('PIE_TEXT_HEIGHT',0.3)
C
C	SET TEXT
C
      CALL PSETI('TEXT_LINE_COUNT',1)
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart in Axis Mode with Pie Size and Text Height Set')
C
C	Plot Coastlines, Pie Chart and Text
C
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 
	SUBROUTINE TEN
C
C	Pie Chart in Geographic Mode with Some Small Slices
C
	CHARACTER*32 COLS,TXT
	DIMENSION PNUM(10), COLS(10), TXT(10)
C
C	Define Slice values
C
	DATA PNUM/4.,100.0,2.,130.0,150.,5.,40.,100.,10.,25.0/ 
	DATA COLS/'RED','GREEN','YELLOW','BLUE','MAGENTA','CYAN',
     X  'RED','GREEN','YELLOW','BLUE'/
	DATA TXT/'Synop','Temp','Pilot','Satob','Satem','Airep',
     X  'Dribu','Asynop','Aship','Paob'/
	
	CALL PSETC ('PS_DEVICE','ps_a4')
	CALL PSETC ('PAGE_ID_LINE_USER_TEXT','PIE10')
C
C	Define Position of Pie Chart - 10 Degrees North, 20 Degrees East
C
c      CALL PSETI ('DEVICE_WIDTH',800)
c      CALL PSETR('SUPER_PAGE_X_LENGTH',29.7)
c      CALL PSETR('SUPER_PAGE_Y_LENGTH',21.0)
c      CALL PSETR('PAGE_X_LENGTH',29.7)
c      CALL PSETR('PAGE_Y_LENGTH',21.0)
       CALL PSETC('SUBPAGE_MAP_PROJECTION','CYLINDRICAL')
c      CALL PSETR('SUBPAGE_LOWER_LEFT_LATITUDE',0.0)
c      CALL PSETR('SUBPAGE_LOWER_LEFT_LONGITUDE',-20.0)
c      CALL PSETR('SUBPAGE_UPPER_RIGHT_LONGITUDE',115.0)
	CALL PSETC ('PIE_POSITION_MODE','GEOGRAPHIC')
	CALL PSETR ('PIE_X_POSITION',20.0) 
	CALL PSETR ('PIE_Y_POSITION',10.0)
cCALL PSETR ('PIE_SIZE',3.0)
C
C	Set PIE Chart Slice Values 
C
	CALL PSET1R ('PIE_SLICE_VALUES',PNUM,10)
	CALL PSET1C ('PIE_SLICE_COLOURS',COLS,10) 
	CALL PSET1C ('PIE_DESCRIPTION_TEXT',TXT,10) 
	CALL PSETC ('PIE_DESCRIPTION_TEXT_ORIENTATION','RADIAL')
	CALL PSETC ('PIE_VALUE_TEXT_FORMAT','(F5.1)')
	CALL PSETC ('PIE_VALUE_TEXT_BLANKING','ON')
	CALL PSETC ('PIE_TEXT_COLOUR','BLACK') 
C
C	SET TEXT
C
      CALL PSETI('TEXT_LINE_COUNT',2)
	CALL PSETC ('TEXT_LINE_1',
     X  'Pie Chart in Geographic Mode with some Small Slices')
	CALL PSETC ('TEXT_LINE_2',
     X  'Description Text Orientation = RADIAL, TEXT_COLOUR= BLACK')
C
C	Plot Coastlines, Pie Chart and Text
C
	CALL PSETC ('MAP_COASTLINE_COLOUR','GREY')
	CALL PSETC ('MAP_GRID_COLOUR','GREY')
	CALL PCOAST
	CALL PPIE 
	CALL PTEXT 
	
	RETURN 
	END 
