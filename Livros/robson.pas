unit ULivroFiscalArquivoMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Db, DBCtrls, Grids, DBGrids;

type
  TFLFiscalArqMagnetico = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ME0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Panel2: TPanel;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    DBGrid1: TDBGrid;
    DSMagnetico: TDataSource;
    Button1: TButton;
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLFiscalArqMagnetico: TFLFiscalArqMagnetico;

implementation

uses UFilialCons, UFilial_cl, ULivroFiscalParam, ULivroFiscal_Cl;

{$R *.DFM}

procedure TFLFiscalArqMagnetico.ME0FilialExit(Sender: TObject);
begin
 inherited;
{  If Trim(ME0Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.ParamByName('PK').AsFloat := StrToFloat(ME0Filial.Text);
    QFilial.Open;
    Ed0Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed0Filial.Text := 'Todos';
 }
end;

procedure TFLFiscalArqMagnetico.Bt0ConsFilialClick(
  Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;
end;

procedure TFLFiscalArqMagnetico.BtOkClick(Sender: TObject);
var
   F : TextFile;
   S : string;
   wNum_Inscricao : String;

begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  with DMLivroFiscal do
  begin
    AssignFile(F, 'C:\SEFAAM.TXT');
    Rewrite(F);

    QRLivroFiscalArquivo.Close;
    QRLivroFiscalArquivo.ParamByName('COD_FILIAL').AsFloat := StrToFloat(ME0Filial.Text);
    QRLivroFiscalArquivo.ParamByName('DATA_INICIAL').AsDate := StrToDate(ME0DataI.Text);
    QRLivroFiscalArquivo.ParamByName('DATA_FINAL').AsDate := StrToDate(ME0DataF.Text);
    QRLivroFiscalArquivo.Open;
    QRLivroFiscalArquivo.First;
    S := '' ;
    S:= '10'                                      + { Tipo }
        Copy(QRLivroFiscalArquivoNUM_CGC.Value, 1, 2)    +
        Copy(QRLivroFiscalArquivoNUM_CGC.Value, 4, 3)    +
        Copy(QRLivroFiscalArquivoNUM_CGC.Value, 8, 3)    +
        Copy(QRLivroFiscalArquivoNUM_CGC.Value, 12,4)    +
        Copy(QRLivroFiscalArquivoNUM_CGC.Value, 17,2)    +
        QRLivroFiscalArquivoDESC_INSCRICAO.Value         +
        Ed0Filial.Text                                   +
        Copy(QRLivroFiscalArquivoDESC_CIDADE.Text,1,30)  +
        QRLivroFiscalArquivoUF_FILIAL.Value              +
        Copy(QRLivroFiscalArquivoDESC_TELEFONE.Value,1,3)+
        Copy(QRLivroFiscalArquivoDESC_TELEFONE.Value,5,3)+
        Copy(QRLivroFiscalArquivoDESC_TELEFONE.Value,9,4)+
        Copy(ME0DataI.Text,7,4)                          +
        Copy(ME0DataI.Text,4,2)                          +
        Copy(ME0DataI.Text,1,2)                          +
        Copy(ME0DataF.Text,7,4)                          +
        Copy(ME0DataF.Text,4,2)                          +
        Copy(ME0DataF.Text,1,2)                          +
        '2'                                              + { Código do padrao utilizado no arquivo magnetico.}
        '1' + Chr(10)+Chr(13) ;                                     { Código da finalidade do arquivo magnetico }
    { Remove picture do campo e verifica conteudo }
    wNum_Inscricao := Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,1,1);
    If ( wNum_Inscricao = 'I' ) Or
       ( QRLivroFiscalArquivoNUM_INSCRICAO.Value = '' ) then
       wNum_Inscricao := UpperCase('ISENTO       ')
    else
       wNum_Inscricao:=Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, 1,3)+
                       Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value, 5,5)+
                       Copy(QRLivroFiscalArquivoNUM_INSCRICAO.Value,10,2) ;

    S:= S + '50'                                         + { Tipo }
        Copy(QRLivroFiscalArquivoNUM_CGC_CPF.Value, 1, 2)+
        Copy(QRLivroFiscalArquivoNUM_CGC_CPF.Value, 4, 3)+
        Copy(QRLivroFiscalArquivoNUM_CGC_CPF.Value, 8, 3)+
        Copy(QRLivroFiscalArquivoNUM_CGC_CPF.Value, 12,4)+
        Copy(QRLivroFiscalArquivoNUM_CGC_CPF.Value, 17,2)+
        wNum_Inscricao                                   +
        Copy(QRLivroFiscalArquivoDT_EMISSAO.Text,7,4)    +  {Ano}
        Copy(QRLivroFiscalArquivoDT_EMISSAO.Text,4,2)    +  {Mes}
        Copy(QRLivroFiscalArquivoDT_EMISSAO.Text,1,2)    +  {Dia}
        QRLivroFiscalArquivoUF_CLIENTE.Value             +
        'MD'                                             +  { Modelo da nota???}
        QRLivroFiscalArquivoCOD_SERIE.Value              +
        'SS'                                             + { Sub-serie da NFiscal }
        QRLivroFiscalArquivoNUM_NOTA.Text                +
        'CFO'                                            + { Classificação Fiscal de Operação }
        QRLivroFiscalArquivoVAL_TOTAL.Text               +
        QRLivroFiscalArquivoVAL_ICM_BASE.Text            +
        QRLivroFiscalArquivoVAL_ICM.Text                 +
        QRLivroFiscalArquivoSVAL_ISENTAS.Text            +
        '0000000000000'                                  + {Outras}
        QRLivroFiscalArquivoPERC_ALIQUOTA.Text           +
        'N' ;

    Writeln(F, S);
    CloseFile(F);
    ShowMessage('Arquivo Gerado com Sucesso!') ;

  end;

end;

procedure TFLFiscalArqMagnetico.Button1Click(Sender: TObject);
begin
  with DMLivroFiscal do
  begin
  QRLivroFiscalArquivo.Close;
  QRLivroFiscalArquivo.ParamByName('COD_FILIAL').AsFloat := StrToFloat(ME0Filial.Text);
  QRLivroFiscalArquivo.ParamByName('DATA_INICIAL').AsDate := StrToDate(ME0DataI.Text);
  QRLivroFiscalArquivo.ParamByName('DATA_FINAL').AsDate := StrToDate(ME0DataF.Text);
  QRLivroFiscalArquivo.Open;
  QRLivroFiscalArquivo.First;
  DBGrid1.Refresh;
  end;

end;

end.
