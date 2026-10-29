unit UBaixaFidelidadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFPagamentoFidelidadeCad = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MEValPagamento: TMaskEdit;
    Bevel1: TBevel;
    MEDtPagamento: TMaskEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPagamentoFidelidadeCad: TFPagamentoFidelidadeCad;

implementation

uses UFidelidade_cl, UFidelidadeCad, UUsuario_cl;

{$R *.DFM}

procedure TFPagamentoFidelidadeCad.BitBtn1Click(Sender: TObject);
begin
  if FFidelidadeCad.MeFilial.Text = '' then
    Raise Exception.Create('É necessário informar uma Filial !');
  if (FFidelidadeCad.wValCompras * 10 -FFidelidadeCad.wValPagtoFidelidade) < StrToFloat(MEValPagamento.Text) then
      raise exception.create('Valor de Pagamento Maior do que Saldo.');  

  with DMFidelidade do
  begin
    QBaixaFidelidade.Open;
    QBaixaFidelidade.Insert;
    QBaixaFidelidadeCod_Cadastro.Value:=StrToInt(Trim(FFidelidadeCad.MeCadastro.text));
    QBaixaFidelidadeCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
    QBaixaFidelidadeDt_Baixa.Value:=StrToDate(MEDtPagamento.Text);
    QBaixaFidelidadeVAL_BAIXA.Value:=StrToFloat(MEValPagamento.Text);
    QBaixaFidelidadeCOD_FILIAL.Value:=StrToInt(Trim(FFidelidadeCad.MeFilial.text));
    QBaixaFidelidade.Post;
    QBaixaFidelidade.Close;
    FFidelidadeCad.SBProcurar.Click;
  end;
end;

procedure TFPagamentoFidelidadeCad.FormActivate(Sender: TObject);
begin
  MEDtPagamento.Text:=DateToStr(date);
//  MEValPagamento.Text:=FFidelidadeCad.Label10.Caption;
end;

end.
