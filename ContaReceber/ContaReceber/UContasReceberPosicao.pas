unit UContasReceberPosicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Db, DBCtrls, Grids, DBGrids;

type
  TFContasReceberPosicao = class(TForm)
    Label1: TLabel;
    MeCodigo: TMaskEdit;
    BitBtn3: TBitBtn;
    EdCliente: TMaskEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    BtProcurar: TBitBtn;
    LblSituacao: TLabel;
    LblClassificacao: TLabel;
    DBGrid1: TDBGrid;
    dscontasreceberposicao: TDataSource;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    procedure MeCodigoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasReceberPosicao: TFContasReceberPosicao;

implementation

uses UContasReceber_cl, UOracle_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFContasReceberPosicao.MeCodigoExit(Sender: TObject);
Var wClassificacao,wCgc : String;
begin
  If Trim(MECodigo.Text)<>'' then
   Begin
     EdCliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MECodigo.Text));
     wClassificacao:=DMOracle.BuscaNome('SELECT COD_CLASS_CADASTRO FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MECodigo.Text));
     IF wClassificacao <> '' Then
        LblClassificacao.Caption :=DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+Trim(wClassificacao));
   End;
end;

procedure TFContasReceberPosicao.BitBtn3Click(Sender: TObject);
begin
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
     MeCodigo.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
end;

procedure TFContasReceberPosicao.BtProcurarClick(Sender: TObject);
Var wCgc,wCgc1,wCnpj_Cadastro : String;
    I : Integer;
begin
  EdCliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MECodigo.Text));
  With DMContasReceber Do
  Begin
    QContasReceberPosicao.Close;
    QContasReceberPosicao.SetVariable('Data_Referencia',DMOracle.Dataserv);
    QContasReceberPosicao.SetVariable('Cadastro',StrToint(Trim(MeCodigo.Text)));
    QContasReceberPosicao.Open;
    MeCodigo.SetFocus;
    LblSituacao.Caption := '';
    wCnpj_Cadastro := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MeCodigo.Text));
    If wCnpj_Cadastro <> '' Then
    Begin
      wCgc1 := '';
      For i := 1 to 18 do
          if wCnpj_Cadastro[I] in ['0','1','2','3','4','5','6','7','8','9'] then
             wCgc1 := wCgc1 + wCnpj_Cadastro[I];
      If (DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO_BLOQUEADO','NUM_CGC_CPF = '+wCgc1)) <> '' Then
         LblSituacao.Caption := 'Cadastro Bloqueado na Zadimel/Faville';
    End;
    QRContasReceberPosicao.Close;
    QRContasReceberPosicao.SetVariable('CADASTRO',MeCodigo.Text);
    QRContasReceberPosicao.Open;
  End;
end;

end.
