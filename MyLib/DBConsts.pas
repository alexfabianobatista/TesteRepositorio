{ *************************************************************************** }
{                                                                             }
{ Kylix and Delphi Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1997, 2001 Borland Software Corporation                       }
{                                                                             }
{ *************************************************************************** }


unit DBConsts;

interface

resourcestring
  SInvalidFieldSize = 'Tamanho de Campo Inválido'; //ALT_BIBLIOTECA
  SInvalidFieldKind = 'Tipo de Campo Inválido'; //ALT_BIBLIOTECA
  SInvalidFieldRegistration = 'Invalid field registration';
  SUnknownFieldType = 'Field ''%s'' is of an unknown type';
  SFieldNameMissing = 'Field name missing';
  SDuplicateFieldName = 'Nome de campo duplicado ''%s'''; //ALT_BIBLIOTECA
  SFieldNotFound = 'Campo ''%s'' não encontrado'; //ALT_BIBLIOTECA
  SFieldAccessError = 'Cannot access field ''%s'' as type %s';
  SFieldValueError = 'Valor inválido para o campo ''%s''';  //ALT_BIBLIOTECA
  SFieldRangeError = '%g não é um valor válido para o campo ''%s''. O intervalo permitido é de %g até %g'; //ALT_BIBLIOTECA
  SBcdFieldRangeError = '%s is not a valid value for field ''%s''. The allowed range is %s to %s';
  SInvalidIntegerValue = '''%s'' não é um valor inteiro válido para o campo ''%s'''; //ALT_BIBLIOTECA
  SInvalidBoolValue = '''%s'' não é um valor lógico válido para o campo ''%s'''; //ALT_BIBLIOTECA
  SInvalidFloatValue = '''%s'' não é um valor real válido para o campo ''%s'''; //ALT_BIBLIOTECA
  SFieldTypeMismatch = 'Type mismatch for field ''%s'', expecting: %s actual: %s';
  SFieldSizeMismatch = 'Size mismatch for field ''%s'', expecting: %d actual: %d';
  SInvalidVarByteArray = 'Invalid variant type or size for field ''%s''';
  SFieldOutOfRange = 'Valor do campo ''%s'' está fora do intervalo'; //ALT_BIBLIOTECA
//  SBCDOverflow = '(Overflow)';
  SFieldRequired = 'Campo ''%s'' precisa ter um valor'; //ALT_BIBLIOTECA
  SDataSetMissing = 'Campo ''%s'' não tem dataset'; //ALT_BIBLIOTECA
  SInvalidCalcType = 'Field ''%s'' cannot be a calculated or lookup field';
  SFieldReadOnly = 'Campo ''%s'' não pode ser modificado'; //ALT_BIBLIOTECA
  SFieldIndexError = 'Field index out of range';
  SNoFieldIndexes = 'No index currently active';
  SNotIndexField = 'Field ''%s'' is not indexed and cannot be modified';
  SIndexFieldMissing = 'Cannot access index field ''%s''';
  SDuplicateIndexName = 'Duplicate index name ''%s''';
  SNoIndexForFields = 'No index for fields ''%s''';
  SIndexNotFound = 'Index ''%s'' not found';
  SDuplicateName = 'Duplicate name ''%s'' in %s';
  SCircularDataLink = 'Circular datalinks are not allowed';
  SLookupInfoError = 'Lookup information for field ''%s'' is incomplete';
  SNewLookupFieldCaption = 'New Lookup Field';
  SDataSourceChange = 'DataSource cannot be changed';
  SNoNestedMasterSource = 'Nested datasets cannot have a MasterSource';
  SDataSetOpen = 'Não é possível fazer esta operação em um DataSet Aberto'; //ALT_BIBLIOTECA
  SNotEditing = 'Dataset não esta no modo de alteração ou inserção';  //ALT_BIBLIOTECA
  SDataSetClosed = 'Não é possivel fazer esta operacao em um DataSet Fechado'; //ALT_BIBLIOTECA
  SDataSetEmpty = 'Não é possível fazer esta operação em um DataSet vazio'; //ALT_BIBLIOTECA
  SDataSetReadOnly = 'Não é possível alterar um DataSet somente leitura'; //ALT_BIBLIOTECA
  SNestedDataSetClass = 'Nested dataset must inherit from %s';
  SExprTermination = 'Filter expression incorrectly terminated';
  SExprNameError = 'Unterminated field name';
  SExprStringError = 'Unterminated string constant';
  SExprInvalidChar = 'Invalid filter expression character: ''%s''';
  SExprNoLParen = '''('' expected but %s found';
  SExprNoRParen = ''')'' expected but %s found';
  SExprNoRParenOrComma = ''')'' or '','' expected but %s found';
  SExprExpected = 'Expression expected but %s found';
  SExprBadField = 'Field ''%s'' cannot be used in a filter expression';
  SExprBadNullTest = 'NULL only allowed with ''='' and ''<>''';
  SExprRangeError = 'Constant out of range';
  SExprNotBoolean = 'Field ''%s'' is not of type Boolean';
  SExprIncorrect = 'Incorrectly formed filter expression';
  SExprNothing = 'nothing';
  SExprTypeMis = 'Type mismatch in expression';
  SExprBadScope = 'Operation cannot mix aggregate value with record-varying value';
  SExprNoArith = 'Arithmetic in filter expressions not supported';
  SExprNotAgg = 'Expression is not an aggregate expression';
  SExprBadConst = 'Constant is not correct type %s';
  SExprNoAggFilter = 'Aggregate expressions not allowed in filters';
  SExprEmptyInList = 'IN predicate list may not be empty';
  SInvalidKeywordUse = 'Invalid use of keyword';
  STextFalse = 'False';
  STextTrue = 'True';
  SParameterNotFound = 'Parametro ''%s'' não encontrado';  //ALT_BIBLIOTECA
  SInvalidVersion = 'Unable to load bind parameters';
  SParamTooBig = 'Parameter ''%s'', cannot save data larger than %d bytes';
  SBadFieldType = 'Field ''%s'' is of an unsupported type';
  SAggActive = 'Property may not be modified while aggregate is active';
  SProviderSQLNotSupported = 'SQL not supported: %s';
  SProviderExecuteNotSupported = 'Execute not supported: %s';
  SExprNoAggOnCalcs = 'Field ''%s'' is not the correct type of calculated field to be used in an aggregate, use an internalcalc';
  SRecordChanged = 'Record not found or changed by another user';
  SDataSetUnidirectional = 'Operation not allowed on a unidirectional dataset';
  SUnassignedVar = 'Unassigned variant value';
  SRecordNotFound = 'Record not found';
  SFileNameBlank = 'FileName property cannot be blank';
  SFieldNameTooLarge = 'Fieldname %s exceeds %d chars';

{ For FMTBcd }

  SBcdOverflow = 'BCD overflow';
  SInvalidBcdValue = '%s is not a valid BCD value';
  SInvalidFormatType = 'Invalid format type for BCD';

{ For SqlTimSt }

  SCouldNotParseTimeStamp = 'Could not parse SQL TimeStamp string';
  SInvalidSqlTimeStamp = 'Invalid SQL date/time values';

  SDeleteRecordQuestion = 'Delete record?';
  SDeleteMultipleRecordsQuestion = 'Delete all selected records?';
  STooManyColumns = 'Grid requested to display more than 256 columns';

  { For reconcile error }
  SSkip = 'Skip';
  SAbort = 'Abort';
  SMerge = 'Merge';
  SCorrect = 'Correct';
  SCancel  = 'Cancel';
  SRefresh = 'Refresh';
  SModified = 'Modified';
  SInserted = 'Inserted';
  SDeleted  = 'Deleted';
  SCaption = 'Update Error - %s';
  SUnchanged = '<Unchanged>';  
  SBinary = '(Binary)';                              
  SAdt = '(ADT)';   
  SArray = '(Array)'; 
  SFieldName = 'Field Name'; 
  SOriginal = 'Original Value'; 
  SConflict = 'Conflicting Value';  
  SValue = ' Value';   
  SNoData = '<No Records>';
  SNew = 'New';    

implementation

end.
