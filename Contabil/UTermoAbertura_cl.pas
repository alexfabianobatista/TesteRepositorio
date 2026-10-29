unit UTermoAbertura_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMTermoAbertura = class(TDataModule)
    QTermoAbertura: TOracleDataSet1;
    QTermoAberturaCons: TOracleDataSet1;
    QTermoAberturaCOD_TERMO_ABERTURA: TIntegerField;
    QTermoAberturaCOD_FILIAL: TIntegerField;
    QTermoAberturaNUM_ORDEM: TFloatField;
    QTermoAberturaDESC_NAT_LIVRO: TStringField;
    QTermoAberturaDT_INICIAL: TDateTimeField;
    QTermoAberturaConsCOD_TERMO_ABERTURA: TIntegerField;
    QTermoAberturaConsCOD_FILIAL: TIntegerField;
    QTermoAberturaConsNUM_ORDEM: TFloatField;
    QTermoAberturaConsDESC_NAT_LIVRO: TStringField;
    QTermoAberturaConsDT_INICIAL: TDateTimeField;
    QRTermo: TOracleDataSet1;
    QRTermoDESC_FILIAL: TStringField;
    QRTermoDESC_ENDERECO: TStringField;
    QRTermoDESC_BAIRRO: TStringField;
    QRTermoDESC_CIDADE: TStringField;
    QRTermoDESC_CEP: TStringField;
    QRTermoNUM_CGC: TStringField;
    QRTermoDESC_INSCRICAO: TStringField;
    QRTermoCONTABILISTA: TStringField;
    QRTermoCPF_CONTABILISTA: TStringField;
    QRTermoCRC_CONTABILISTA: TStringField;
    QRTermoRESPONSAVEL: TStringField;
    QRTermoCPF_RESPONSAVEL: TStringField;
    QRTermoCI_RESPONSAVEL: TStringField;
    QRTermoTITULO: TStringField;
    QRTermoTIPO: TStringField;
    QRTermoDIA: TDateTimeField;
    QRTermoPAGINA: TStringField;
    QRTermolocal: TStringField;
    QRTermopag: TStringField;
    QRTermoDIARIO_RAZAO: TStringField;
    QRTermoTEXTO: TStringField;
    QRTermoFUNC_RESPONSAVEL: TStringField;
    procedure QRTermoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTermoAbertura: TDMTermoAbertura;

implementation

uses UBiblioteca;

{$R *.dfm}

procedure TDMTermoAbertura.QRTermoCalcFields(DataSet: TDataSet);
begin
  QRTermopag.Value := 'Pág.: ' + FormatFloat('0000', StrToInt('0'+QRTermoPAGINA.Value));
  QRTermolocal.Value := QRTermoDESC_CIDADE.Value + ', ' +
      FormatDateTime('dd', QRTermoDIA.Value) + ' de ' +
      Bib.NomeMes(StrToInt(FormatDateTime('MM', QRTermoDIA.Value))) +
      ' de ' + FormatDateTime('yyyy', QRTermoDIA.Value);
end;

end.
