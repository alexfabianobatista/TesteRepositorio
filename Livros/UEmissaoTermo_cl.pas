unit UEmissaoTermo_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, controls;

type
  TDMEmissaoTermo = class(TDataModule)
    QREmissaoTermo: TOracleDataSet1;
    QREmissaoTermopag: TStringField;
    QREmissaoTermolocal: TStringField;
    QREmissaoTermoDESC_FILIAL: TStringField;
    QREmissaoTermoDESC_ENDERECO: TStringField;
    QREmissaoTermoDESC_BAIRRO: TStringField;
    QREmissaoTermoDESC_CIDADE: TStringField;
    QREmissaoTermoDESC_CEP: TStringField;
    QREmissaoTermoNUM_CGC: TStringField;
    QREmissaoTermoDESC_INSCRICAO: TStringField;
    QREmissaoTermoCONTABILISTA: TStringField;
    QREmissaoTermoCPF_CONTABILISTA: TStringField;
    QREmissaoTermoCRC_CONTABILISTA: TStringField;
    QREmissaoTermoRESPONSAVEL: TStringField;
    QREmissaoTermoCPF_RESPONSAVEL: TStringField;
    QREmissaoTermoCI_RESPONSAVEL: TStringField;
    QREmissaoTermoREGISTRO: TStringField;
    QREmissaoTermoMODELO: TStringField;
    QREmissaoTermoNUM_ORDEM: TStringField;
    QREmissaoTermoULT_LANC: TStringField;
    QREmissaoTermoTITULO: TStringField;
    QREmissaoTermoDIA: TDateTimeField;
    QREmissaoTermoTIPO: TStringField;
    QREmissaoTermoPAGINA: TStringField;
    QREmissaoTermoTERMO: TStringField;
    QREmissaoTermoFUNC_RESPONSAVEL: TStringField;
    QREmissaoTermoDESC_ESTADO: TStringField;
    QREmissaoTermoPAGINA_I: TFloatField;
    QREmissaoTermoPAGINA_F: TFloatField;
    QREmissaoTermotexto: TStringField;
    QREmissaoTermoDT_TERMO: TDateTimeField;
    procedure QREmissaoTermoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEmissaoTermo: TDMEmissaoTermo;

implementation

uses UBiblioteca, StrUtils;

{$R *.dfm}

procedure TDMEmissaoTermo.QREmissaoTermoCalcFields(DataSet: TDataSet);
var
  wAux: String;
  wPags: Integer;
  dia : TDate;

begin
  QREmissaoTermopag.Value := 'Pág.: ' + FormatFloat('0000', StrToInt('0'+QREmissaoTermoPAGINA.Value));
//  QREmissaoTermolocal.Value := QREmissaoTermoDESC_CIDADE.Value + ', ' +
//      FormatDateTime('dd', QREmissaoTermoDIA.Value) + ' de ' +
//      Bib.NomeMes(StrToInt(FormatDateTime('MM', QREmissaoTermoDIA.Value))) +
//      ' de ' + FormatDateTime('yyyy', QREmissaoTermoDIA.Value);

  {estava pegando a data atual, mas é necessario sair a data inicial e final do termo
  Se estiver errado descomentar as 4 linhas seguintes.}
  {QREmissaoTermolocal.Value := QREmissaoTermoDESC_CIDADE.Value + ', ' +
      FormatDateTime('dd', Date) + ' de ' +
      Bib.NomeMes(StrToInt(FormatDateTime('MM', Date))) +
      ' de ' + FormatDateTime('yyyy', Date);}
  
  dia := StrToDate(QREmissaoTermoDT_TERMO.Text);
  QREmissaoTermolocal.Value := QREmissaoTermoDESC_CIDADE.Value + ', ' +
    FormatDateTime('dd', dia) + ' de ' + bib.NomeMes(StrToInt(FormatDateTime('MM', dia))) +
    ' de ' + FormatDateTime('yyyy', dia);

  wPags := Trunc(1 + QREmissaoTermoPAGINA_F.Value - QREmissaoTermoPAGINA_I.Value);
  wAux := UpperCase(Bib.extenso(wPags, 'NADA'));
  wAux := 'CONTÉM ESTE LIVRO ' + IntToStr(wPags) + ' (' + Copy(wAux, 1, Length(wAux) - 1) + ') ' +
          ' FOLHAS NUMERADAS AUTOMATICAMENTE E SEGUIDAMENTE POR SISTEMA DE PROCESSAMENTO DE DADOS, DO N° ' +
          QREmissaoTermoPAGINA_I.Text + ' AO N° ' + QREmissaoTermoPAGINA_F.Text +
          ' E ' + IfThen(QREmissaoTermoTIPO.Value = 'ABERTURA','SERVIRA','SERVIU') + ' PARA O LANÇAMENTO ' +
          'DAS OPERAÇÕES PRÓPRIAS DO ESTABELECIMENTO DO CONTRIBUINTE ABAIXO IDENTIFICADO:';
  QREmissaoTermotexto.Value := wAux;
end;

end.
