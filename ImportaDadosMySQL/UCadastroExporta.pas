unit UCadastroExporta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, StdCtrls, Buttons, Db, OracleData, OraTeste, Grids, DBGrids,
  DBTables, ComCtrls;

type
  TFCadastroExporta = class(TForm)
    BtnExportar: TBitBtn;
    QCadastroExporta: TOracleDataSet1;
    QCadastroExportaCOD_CADASTRO: TIntegerField;
    QCadastroExportaCOD_ESTADO: TStringField;
    QCadastroExportaNOME: TStringField;
    QCadastroExportaDESC_ENDERECO: TStringField;
    QCadastroExportaDESC_CIDADE: TStringField;
    QCadastroExportaDESC_CEP: TStringField;
    QCadastroExportaNUM_CGC_CPF: TStringField;
    QCadastroExportaNUM_INSCRICAO: TStringField;
    QCadastroExportaDT_CADASTRO: TDateTimeField;
    QCadastroExportaNUM_CAIXA_POSTAL: TIntegerField;
    QCadastroExportaDT_CANCELAMENTO: TDateTimeField;
    QCadastroExportaDESC_TELEFONE: TStringField;
    QCadastroExportaDESC_CELULAR: TStringField;
    QCadastroExportaNOME_CONTATO: TStringField;
    QCadastroExportaDT_NASCIMENTO: TDateTimeField;
    QCadastroExportaDESC_BAIRRO: TStringField;
    QCadastroExportaDESC_FANTASIA: TStringField;
    QCadastroExportaDESC_TELEFONE_COMERCIAL: TStringField;
    QCadastroExportaDESC_FAX: TStringField;
    QCadastroExportaCOD_VENDEDOR: TIntegerField;
    QCadastroExportaIND_FISICA_JURIDICA: TStringField;
    DBGrid1: TDBGrid;
    DSCadastroExporta: TDataSource;
    TbCaCad: TTable;
    TbCaCadCODCLI: TFloatField;
    TbCaCadNOME: TStringField;
    TbCaCadENDERECO: TStringField;
    TbCaCadCIDADE: TStringField;
    TbCaCadUF: TStringField;
    TbCaCadCDCEP: TFloatField;
    TbCaCadNRCGC: TStringField;
    TbCaCadNRIDENTID: TStringField;
    TbCaCadIDTIPCLIE: TSmallintField;
    TbCaCadIDESTCIVIL: TStringField;
    TbCaCadDTCADASTRO: TDateField;
    TbCaCadIDSEXOCAT: TStringField;
    TbCaCadNRCAXPOST: TFloatField;
    TbCaCadIDNACAO: TSmallintField;
    TbCaCadDTDESLIGA: TDateField;
    TbCaCadIDMOTIVO: TSmallintField;
    TbCaCadNRTELEX: TFloatField;
    TbCaCadNRFAX: TStringField;
    TbCaCadNRFONE: TStringField;
    TbCaCadCDFILIAL: TSmallintField;
    TbCaCadIDCLASS: TSmallintField;
    TbCaCadDATANASCIM: TDateField;
    TbCaCadIDCOMPLEME: TStringField;
    TbCaCadBAIRRO: TStringField;
    TbCaCadPROFISSAO: TStringField;
    TbCaCadFUNRURAL: TStringField;
    TbCaCadCDVENDED: TFloatField;
    TbCaCadCOR: TStringField;
    TbCaCadIDADE: TSmallintField;
    TbCaCadNOTAFISCAL: TStringField;
    TbCaCadDTVISITA: TDateField;
    TbCaCadRAMO_ATI: TSmallintField;
    TbCaCadCONDICOES: TStringField;
    TbCaCadLIMITE: TFloatField;
    TbCaCadPREFIXO: TStringField;
    QCadastroExportaCOD_MOTIVO: TIntegerField;
    QCadastroExportaCOD_TIPO_CADASTRO: TIntegerField;
    QCadastroExportaCOD_REGIAO: TIntegerField;
    QCadastroExportaCOD_PAIS: TIntegerField;
    QCadastroExportaCOD_ESTADO_CIVIL: TIntegerField;
    QCadastroExportaCOD_RAMO: TIntegerField;
    QCadastroExportaIND_SEXO_CATEGORIA: TStringField;
    QCadastroExportaPERC_FUNRURAL: TFloatField;
    QCadastroExportaVAL_LIMITE: TFloatField;
    QCadastroExportaDESC_CIDADE_COBRANCA: TStringField;
    QCadastroExportaDESC_ENDERECO_COBRANCA: TStringField;
    QCadastroExportaDESC_ESTADO_COBRANCA: TStringField;
    QCadastroExportaDESC_CEP_COBRANCA: TStringField;
    QCadastroExportaNUM_JUNTA: TIntegerField;
    QCadastroExportaDT_FUNDACAO: TDateTimeField;
    QCadastroExportaDT_JUNTA: TDateTimeField;
    QCadastroExportaNOME_MAE: TStringField;
    QCadastroExportaNOME_PAI: TStringField;
    QCadastroExportaDESC_NATURALIDADE: TStringField;
    QCadastroExportaDESC_ESTADO_NATURAL: TStringField;
    QCadastroExportaDT_EXPEDICAO_IDENTIDADE: TDateTimeField;
    QCadastroExportaDESC_E_MAIL: TStringField;
    QCadastroExportaDESC_FAX_COBRANCA: TStringField;
    QCadastroExportaIND_SEPROC_SIMNAO: TStringField;
    QCadastroExportaDESC_INSCRICAO_MUNICIPAL: TStringField;
    QCadastroExportaNOME_CONJUGE: TStringField;
    QCadastroExportaDESC_CPF_CONJUGE: TStringField;
    QCadastroExportaDESC_IDENTIDADE_CONJUGE: TStringField;
    QCadastroExportaCOD_CLASS_CADASTRO: TIntegerField;
    QCadastroExportaCOD_BANCO_AGENCIA: TIntegerField;
    QCadastroExportaCOD_OPERACAO_CC: TIntegerField;
    QCadastroExportaDT_NASCIMENTO_CONTATO: TDateTimeField;
    QCadastroExportaNOME_CONTATO2: TStringField;
    QCadastroExportaDT_NASCIMENTO2: TDateTimeField;
    QCadastroExportaPERC_COMISSAO: TFloatField;
    QCadastroExportaDESC_COMPLEMENTO: TStringField;
    QCadastroExportaDESC_ENDERECO_ENTREGA: TStringField;
    QCadastroExportaDESC_CIDADE_ENTREGA: TStringField;
    QCadastroExportaDESC_BAIRRO_ENTREGA: TStringField;
    QCadastroExportaDESC_OBS: TStringField;
    QCadastroExportaDESC_OBS1: TStringField;
    QCadastroExportaDESC_OBS2: TStringField;
    procedure BtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroExporta: TFCadastroExporta;

implementation

uses UCadastro_cl, UOracle_cl;

{$R *.DFM}

procedure TFCadastroExporta.BtnExportarClick(Sender: TObject);
var wCep, S: String;
    x: Integer;
begin
 // Grava dados Query dentro do arquivo DBF
 QCadastroExporta.Close;
 QCadastroExporta.open;
 QCadastroExporta.First;
 TbCaCad.Close;
 TbCaCad.Open;

 BtnExportar.Enabled:= False;

 while not QCadastroExporta.Eof do
 begin
   TbCaCad.Append;
   TbCaCadCODCLI.Value    := QCadastroExportaCOD_CADASTRO.Value;
   TbCaCadNOME.Value      := QCadastroExportaNOME.Value;
   TbCaCadENDERECO.Value  := QCadastroExportaDESC_ENDERECO.Value;
   TbCaCadCIDADE.Value    := QCadastroExportaDESC_CIDADE.Value;
   TbCaCadUF.Value        := QCadastroExportaCOD_ESTADO.Value;

   wCep:= Trim(QCadastroExportaDESC_CEP.Value);

   S:= '';
   for x := 1 to length(wCep) do
    if wCep[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S:= S + wCep[x];

   if S = '' then
      S:= '0';

   TbCaCadCDCEP.Value     := StrToInt(S);
   TbCaCadNRCGC.Value     := QCadastroExportaNUM_CGC_CPF.Value;
   TbCaCadBAIRRO.Value    := QCadastroExportaDESC_BAIRRO.Value;
   TbCaCadDTCADASTRO.Value:= QCadastroExportaDT_CADASTRO.Value;
   TbCaCadNRFAX.Value     := QCadastroExportaDESC_FAX.Value;
   TbCaCadNRFONE.Value    := QCadastroExportaDESC_TELEFONE.Value;
   TbCaCadCDVENDED.Value  := QCadastroExportaCOD_VENDEDOR.Value;
   TbCaCad.Post;
   QCadastroExporta.Next;
 end;
 BtnExportar.Enabled:= True;
 QCadastroExporta.Close;
 TbCaCad.Close;
end;

end.
