
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit DbConsts;

interface

resourcestring
  SInvalidFieldSize = 'Tamanho de Campo Inválido';
  SInvalidFieldKind = 'Tipo de Campo Inválido';
  SInvalidFieldRegistration = 'Invalid field registration';
  SUnknownFieldType = 'Campo ''%s'' é de um tipo desconhecido';
  SFieldNameMissing = 'Field name missing';
  SDuplicateFieldName = 'Nome de campo duplicado ''%s''';
  SFieldNotFound = 'Campo ''%s'' não encontrado';
  SFieldAccessError = 'Cannot access field ''%s'' as type %s';
  SFieldValueError = 'Valor inválido para o campo ''%s''';
  SFieldRangeError = '%g não é um valor válido para o campo ''%s''. O intervalo permitido é de %g até %g';
  SInvalidIntegerValue = '''%s'' não é um valor inteiro válido para o campo ''%s''';
  SInvalidBoolValue = '''%s'' não é um valor lógico válido para o campo ''%s''';
  SInvalidFloatValue = '''%s'' não é um valor real válido para o campo ''%s''';
  SFieldTypeMismatch = 'Type mismatch for field ''%s'', expecting: %s actual: %s';
  SFieldSizeMismatch = 'Size mismatch for field ''%s'', expecting: %d actual: %d';
  SInvalidVarByteArray = 'Invalid variant type or size for field ''%s''';
  SFieldOutOfRange = 'Valor do campo ''%s'' está fora do intervalo';
  SBCDOverflow = '(Overflow)';
  SFieldRequired = 'Campo ''%s'' precisa ter um valor';
  SDataSetMissing = 'Campo ''%s'' não tem dataset';
  SInvalidCalcType = 'Field ''%s'' cannot be a calculated or lookup field';
  SFieldReadOnly = 'Campo ''%s'' não pode ser modificado';
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
  SDataSourceChange = 'DataSource cannot be changed';
  SNoNestedMasterSource = 'Nested datasets cannot have a MasterSource';
  SDataSetOpen = 'Não é possível fazer esta operação em um DataSet Aberto';
  SNotEditing = 'Dataset não esta no modo de alteração ou inserção';
  SDataSetClosed = 'Não é possivel fazer esta operacao em um DataSet Fechado';
  SDataSetEmpty = 'Não é possível fazer esta operação em um DataSet vazio';
  SDataSetReadOnly = 'Não é possível alterar um DataSet somente leitura';
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
  SParameterNotFound = 'Parametro ''%s'' não encontrado';
  SInvalidVersion = 'Unable to load bind parameters';
  SParamTooBig = 'Parameter ''%s'', cannot save data larger than %d bytes';
  SParamBadFieldType = 'Field ''%s'' is of an unsupported type';
  SAggActive = 'Property may not be modified while aggregate is active';

  { DBCtrls }
  SFirstRecord = 'Primeiro Registro';
  SPriorRecord = 'Registro Anterior';
  SNextRecord = 'Próximo Registro';
  SLastRecord = 'Último Registro';
  SInsertRecord = 'Novo Registro';
  SDeleteRecord = 'Apagar Registro';
  SEditRecord = 'Alterar Registro';
  SPostEdit = 'Confirmar';
  SCancelEdit = 'Cancelar Alterações';
  SRefreshRecord = 'Atualizar Dados';
  SDeleteRecordQuestion = 'Apagar Registro?';
  SDeleteMultipleRecordsQuestion = 'Apagar todos os registro selecionados?';
  SRecordNotFound = 'Registro não encontrado';
  SDataSourceFixed = 'Operation not allowed in a DBCtrlGrid';
  SNotReplicatable = 'Control cannot be used in a DBCtrlGrid';
  SPropDefByLookup = 'Property already defined by lookup field';
  STooManyColumns = 'Grid requested to display more than 256 columns';

  { DBLogDlg }
  SRemoteLogin = 'Remote Login';

  { DBOleEdt }
  SDataBindings = 'Data Bindings...';

implementation

end.
