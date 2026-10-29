{ *********************************************************************** }
{                                                                         }
{ Delphi / Kylix Cross-Platform Runtime Library                           }
{                                                                         }
{ Copyright (c) 1995, 2001 Borland Software Corporation                   }
{                                                                         }
{ *********************************************************************** }

unit SysConst;                                   

interface

resourcestring
  SUnknown = '<unknown>';
  SInvalidInteger = '''%s'' não é um inteiro válido'; //ALT_BIBLIOTECA
  SInvalidFloat = '''%s'' não é um número ou código válido'; //ALT_BIBLIOTECA
  SInvalidCurrency = '''%s'' is not a valid currency value';
  SInvalidDate = '''%s'' não é uma data válida'; //ALT_BIBLIOTECA
  SInvalidTime = '''%s'' não é uma hora válida'; //ALT_BIBLIOTECA
  SInvalidDateTime = '''%s'' is not a valid date and time';
  SInvalidDateTimeFloat = '''%g'' is not a valid date and time';
  SInvalidTimeStamp = '''%d.%d'' is not a valid timestamp';
  SInvalidGUID = '''%s'' is not a valid GUID value';
  SInvalidBoolean = '''%s'' is not a valid boolean value';
  STimeEncodeError = 'Invalid argument to time encode';
  SDateEncodeError = 'Invalid argument to date encode';
  SOutOfMemory = 'Out of memory';
  SInOutError = 'I/O error %d';
  SFileNotFound = 'File not found';
  SInvalidFilename = 'Invalid filename';
  STooManyOpenFiles = 'Too many open files';
  SAccessDenied = 'File access denied';
  SEndOfFile = 'Read beyond end of file';
  SDiskFull = 'Disk full';
  SInvalidInput = 'Invalid numeric input';
  SDivByZero = 'Divisão por zero'; //ALT_BIBLIOTECA
  SRangeError = 'Range check error';
  SIntOverflow = 'Integer overflow';
  SInvalidOp = 'Invalid floating point operation';
  SZeroDivide = 'Floating point division by zero';
  SOverflow = 'Floating point overflow';
  SUnderflow = 'Floating point underflow';
  SInvalidPointer = 'Invalid pointer operation';
  SInvalidCast = 'Invalid class typecast';
{$IFDEF MSWINDOWS}
  SAccessViolationArg3 = 'Access violation at address %p. %s of address %p';
{$ENDIF}
{$IFDEF LINUX}
  SAccessViolationArg2 = 'Access violation at address %p, accessing address %p';
{$ENDIF}
  SAccessViolationNoArg = 'Access violation';
  SStackOverflow = 'Stack overflow';
  SControlC = 'Control-C hit';
  SQuit = 'Quit key hit';
  SPrivilege = 'Privileged instruction';
  SOperationAborted = 'Operation aborted';
  SException = 'Exception %s in module %s at %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = 'Application Error';
{$IFDEF LINUX}
  SSigactionFailed = 'sigaction call failed';
{$ENDIF}
  SInvalidFormat = 'Format ''%s'' invalid or incompatible with argument';
  SArgumentMissing = 'No argument for format ''%s''';
  SDispatchError = 'Variant method calls not supported';
  SReadAccess = 'Read';
  SWriteAccess = 'Write';
  SResultTooLong = 'Format result longer than 4096 characters';
  SFormatTooLong = 'Format string too long';

  SVarArrayCreate = 'Error creating variant or safe array';
  SVarArrayBounds = 'Variant or safe array index out of bounds';
  SVarArrayLocked = 'Variant or safe array is locked';
  SVarArrayWithHResult = 'Unexpected variant or safe array error: %s%.8x';

  SInvalidVarCast = 'Invalid variant type conversion';
  SInvalidVarOp = 'Invalid variant operation';
  SInvalidVarNullOp = 'Invalid NULL variant operation';
  SInvalidVarOpWithHResultWithPrefix = 'Invalid variant operation (%s%.8x)'#10'%s';
  SVarTypeRangeCheck1 = 'Range check error for variant of type (%s)';
  SVarTypeRangeCheck2 = 'Range check error while converting variant of type (%s) into type (%s)';
  SVarTypeOutOfRangeWithPrefix = 'Custom variant type (%s%.4x) is out of range';
  SVarTypeAlreadyUsedWithPrefix = 'Custom variant type (%s%.4x) already used by %s';
  SVarTypeNotUsableWithPrefix = 'Custom variant type (%s%.4x) is not usable';
  SVarTypeTooManyCustom = 'Too many custom variant types have been registered';

  // the following are not used anymore
  SVarNotArray = 'Variant is not an array' deprecated; // not used, use SVarInvalid instead
  SVarTypeUnknown = 'Unknown custom variant type ($%.4x)' deprecated; // not used anymore
  SVarTypeOutOfRange = 'Custom variant type ($%.4x) is out of range' deprecated;
  SVarTypeAlreadyUsed = 'Custom variant type ($%.4x) already used by %s' deprecated;
  SVarTypeNotUsable = 'Custom variant type ($%.4x) is not usable' deprecated;
  SInvalidVarOpWithHResult = 'Invalid variant operation ($%.8x)' deprecated;

  SVarTypeCouldNotConvert = 'Could not convert variant of type (%s) into type (%s)';
  SVarTypeConvertOverflow = 'Overflow while converting variant of type (%s) into type (%s)';
  SVarOverflow = 'Variant overflow';
  SVarInvalid = 'Invalid argument';
  SVarBadType = 'Invalid variant type';
  SVarNotImplemented = 'Operation not supported';
  SVarOutOfMemory = 'Variant operation ran out memory';
  SVarUnexpected = 'Unexpected variant error';

  SVarDataClearRecursing = 'Recursion while doing a VarDataClear';
  SVarDataCopyRecursing = 'Recursion while doing a VarDataCopy';
  SVarDataCopyNoIndRecursing = 'Recursion while doing a VarDataCopyNoInd';
  SVarDataInitRecursing = 'Recursion while doing a VarDataInit';
  SVarDataCastToRecursing = 'Recursion while doing a VarDataCastTo';
  SVarIsEmpty = 'Variant is empty';
  sUnknownFromType = 'Cannot convert from the specified type';
  sUnknownToType = 'Cannot convert to the specified type';
  SExternalException = 'External exception %x';
  SAssertionFailed = 'Assertion failed';
  SIntfCastError = 'Interface not supported';
  SSafecallException = 'Exception in safecall method';
  SAssertError = '%s (%s, line %d)';
  SAbstractError = 'Abstract Error';
  SModuleAccessViolation = 'Access violation at address %p in module ''%s''. %s of address %p';
  SCannotReadPackageInfo = 'Cannot access package information for package ''%s''';
  sErrorLoadingPackage = 'Can''t load package %s.'+sLineBreak+'%s';
  SInvalidPackageFile = 'Invalid package file ''%s''';
  SInvalidPackageHandle = 'Invalid package handle';
  SDuplicatePackageUnit = 'Cannot load package ''%s.''  It contains unit ''%s,''' +
    'which is also contained in package ''%s''';
  SOSError = 'System Error.  Code: %d.'+sLineBreak+'%s';
  SUnkOSError = 'A call to an OS function failed';
{$IFDEF MSWINDOWS}
  SWin32Error = 'Win32 Error.  Code: %d.'#10'%s' deprecated; // use SOSError
  SUnkWin32Error = 'A Win32 API function failed' deprecated; // use SUnkOSError
{$ENDIF}
  SNL = 'Application is not licensed to use this feature';

  SShortMonthNameJan = 'Jan';  //ALT_BIBLIOTECA
  SShortMonthNameFeb = 'Fev';  //ALT_BIBLIOTECA
  SShortMonthNameMar = 'Mar';  //ALT_BIBLIOTECA
  SShortMonthNameApr = 'Abr';  //ALT_BIBLIOTECA
  SShortMonthNameMay = 'Mai';  //ALT_BIBLIOTECA
  SShortMonthNameJun = 'Jun';  //ALT_BIBLIOTECA
  SShortMonthNameJul = 'Jul';  //ALT_BIBLIOTECA
  SShortMonthNameAug = 'Ago';  //ALT_BIBLIOTECA
  SShortMonthNameSep = 'Set';  //ALT_BIBLIOTECA
  SShortMonthNameOct = 'Out';  //ALT_BIBLIOTECA
  SShortMonthNameNov = 'Nov';  //ALT_BIBLIOTECA
  SShortMonthNameDec = 'Dez';  //ALT_BIBLIOTECA

  SLongMonthNameJan = 'Janeiro'; //ALT_BIBLIOTECA
  SLongMonthNameFeb = 'Fevereiro'; //ALT_BIBLIOTECA
  SLongMonthNameMar = 'Março';  //ALT_BIBLIOTECA
  SLongMonthNameApr = 'Abril';  //ALT_BIBLIOTECA
  SLongMonthNameMay = 'Maio';    //ALT_BIBLIOTECA
  SLongMonthNameJun = 'Junho';   //ALT_BIBLIOTECA
  SLongMonthNameJul = 'Julho';   //ALT_BIBLIOTECA
  SLongMonthNameAug = 'Agosto'; //ALT_BIBLIOTECA
  SLongMonthNameSep = 'Setembro'; //ALT_BIBLIOTECA
  SLongMonthNameOct = 'Outubro';  //ALT_BIBLIOTECA
  SLongMonthNameNov = 'Novembro'; //ALT_BIBLIOTECA
  SLongMonthNameDec = 'Dezembro'; //ALT_BIBLIOTECA

  SShortDayNameSun = 'Dom'; //ALT_BIBLIOTECA
  SShortDayNameMon = 'Seg'; //ALT_BIBLIOTECA
  SShortDayNameTue = 'Ter'; //ALT_BIBLIOTECA
  SShortDayNameWed = 'Qua'; //ALT_BIBLIOTECA
  SShortDayNameThu = 'Qui'; //ALT_BIBLIOTECA
  SShortDayNameFri = 'Sex'; //ALT_BIBLIOTECA
  SShortDayNameSat = 'Sab'; //ALT_BIBLIOTECA

  SLongDayNameSun = 'Domingo';
  SLongDayNameMon = 'Segunda';
  SLongDayNameTue = 'Terça';
  SLongDayNameWed = 'Quarta';
  SLongDayNameThu = 'Quinta';
  SLongDayNameFri = 'Sexta';
  SLongDayNameSat = 'Sábado';

{$IFDEF LINUX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = 'Unable to create directory';
  SCodesetConversionError = 'Codeset conversion failure';

implementation

end.









