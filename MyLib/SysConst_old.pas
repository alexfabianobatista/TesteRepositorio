
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{                                                       }
{       Copyright (C) 1995,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit SysConst;

interface

resourcestring
  SInvalidInteger = '''%s'' não é um inteiro válido';
  SInvalidFloat = '''%s'' não é um número ou código válido';
  SInvalidDate = '''%s'' não é uma data válida';
  SInvalidTime = '''%s'' não é uma hora válida';
  SInvalidDateTime = '''%s'' is not a valid date and time';
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
  SDivByZero = 'Divisão por zero';
  SRangeError = 'Range check error';
  SIntOverflow = 'Integer overflow';
  SInvalidOp = 'Invalid floating point operation';
  SZeroDivide = 'Floating point division by zero';
  SOverflow = 'Floating point overflow';
  SUnderflow = 'Floating point underflow';
  SInvalidPointer = 'Invalid pointer operation';
  SInvalidCast = 'Invalid class typecast';
  SAccessViolation = 'Access violation at address %p. %s of address %p';
  SStackOverflow = 'Stack overflow';
  SControlC = 'Control-C hit';
  SPrivilege = 'Privileged instruction';
  SOperationAborted = 'Operation aborted';
  SException = 'Exception %s in module %s at %p.'#$0A'%s%s';
  SExceptTitle = 'Application Error';
  SInvalidFormat = 'Format ''%s'' invalid or incompatible with argument';
  SArgumentMissing = 'No argument for format ''%s''';
  SInvalidVarCast = 'Invalid variant type conversion';
  SInvalidVarOp = 'Invalid variant operation';
  SDispatchError = 'Variant method calls not supported';
  SReadAccess = 'Read';
  SWriteAccess = 'Write';
  SResultTooLong = 'Format result longer than 4096 characters';
  SFormatTooLong = 'Format string too long';
  SVarArrayCreate = 'Error creating variant array';
  SVarNotArray = 'Variant is not an array';
  SVarArrayBounds = 'Variant array index out of bounds';
  SExternalException = 'External exception %x';
  SAssertionFailed = 'Assertion failed';
  SIntfCastError = 'Interface not supported';
  SAssertError = '%s (%s, line %d)';
  SAbstractError = 'Abstract Error';
  SModuleAccessViolation = 'Access violation at address %p in module ''%s''. %s of address %p';
  SCannotReadPackageInfo = 'Cannot access package information for package ''%s''';
  sErrorLoadingPackage = 'Can''t load package %s.'#13#10'%s';
  SInvalidPackageFile = 'Invalid package file ''%s''';
  SInvalidPackageHandle = 'Invalid package handle';
  SDuplicatePackageUnit = 'Cannot load package ''%s.''  It contains unit ''%s,''' +
    ';which is also contained in package ''%s''';
  SWin32Error = 'Win32 Error.  Code: %d.'#10'%s';
  SUnkWin32Error = 'A Win32 API function failed';
  SNL = 'Application is not licensed to use this feature';

  SShortMonthNameJan = 'Jan';
  SShortMonthNameFeb = 'Fev';
  SShortMonthNameMar = 'Mar';
  SShortMonthNameApr = 'Abr';
  SShortMonthNameMay = 'Mai';
  SShortMonthNameJun = 'Jun';
  SShortMonthNameJul = 'Jul';
  SShortMonthNameAug = 'Ago';
  SShortMonthNameSep = 'Set';
  SShortMonthNameOct = 'Out';
  SShortMonthNameNov = 'Nov';
  SShortMonthNameDec = 'Dez';

  SLongMonthNameJan = 'Janeiro';
  SLongMonthNameFeb = 'Fevereiro';
  SLongMonthNameMar = 'Março';
  SLongMonthNameApr = 'Abril';
  SLongMonthNameMay = 'Maio';
  SLongMonthNameJun = 'Junho';
  SLongMonthNameJul = 'Julho';
  SLongMonthNameAug = 'Agosto';
  SLongMonthNameSep = 'Setembro';
  SLongMonthNameOct = 'Outubro';
  SLongMonthNameNov = 'Novembro';
  SLongMonthNameDec = 'Dezembro';

  SShortDayNameSun = 'DDD';
  SShortDayNameMon = 'Seg';
  SShortDayNameTue = 'Ter';
  SShortDayNameWed = 'Qua';
  SShortDayNameThu = 'Qui';
  SShortDayNameFri = 'Sex';
  SShortDayNameSat = 'Sab';

  SLongDayNameSun = 'Domingo';
  SLongDayNameMon = 'Segunda';
  SLongDayNameTue = 'Terça';
  SLongDayNameWed = 'Quarta';
  SLongDayNameThu = 'Quinta';
  SLongDayNameFri = 'Sexta';
  SLongDayNameSat = 'Sabado';

implementation

end.





