unit UAdiantamentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus,
  ActnList, ExtCtrls;

type
  TFAdiantamentoCons = class(TFTConsulta)
    MEBcoMovimento: TMaskEdit;
    MECadastro: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SBCaixa: TSpeedButton;
    SBBanco: TSpeedButton;
    SBCadastro: TSpeedButton;
    MECaixa: TMaskEdit;
    MEDescBcoMovimento: TMaskEdit;
    MEDescCadastro: TMaskEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    MeDtInicial: TMaskEdit;
    Label5: TLabel;
    MeDtFinal: TMaskEdit;
    ActionList1: TActionList;
    Action1: TAction;
    RgTipoAdiantamento: TRadioGroup;
    procedure SBCaixaClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure MEBcoMovimentoExit(Sender: TObject);
    procedure SBBancoClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAdiantamentoCons: TFAdiantamentoCons;

implementation

uses UAdiantamento_cl, UCaixaCons, UCaixa_cl, UBancoMovCons,
  UBancoAgencia_cl, UCadastroCons, UCadastro_cl, UOracle_cl,
  UImpressoraFiscal;

{$R *.DFM}

procedure TFAdiantamentoCons.SBCaixaClick(Sender: TObject);
begin
  inherited;
  if FCaixaCons = nil then
    FCaixaCons := TFCaixaCons.create(application);

  if FCaixaCons.showmodal = mrok then
  begin
    METexto.Text := dmcaixa.QCaixa_Mov_ConsCOD_CAIXA_MOV.Text;
    METextoExit(sender);
  end;
end;

procedure TFAdiantamentoCons.METextoExit(Sender: TObject);
begin
  inherited;
  if trim(METexto.Text) <> '' then
    MECaixa.text := DMOracle.BuscaNome('SELECT NUM_DOCUMENTO FROM TB_CAIXA_MOV','COD_CAIXA_MOV = ' + trim(METexto.Text))
  else
    MECaixa.text := '';
end;

procedure TFAdiantamentoCons.MEBcoMovimentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEBcoMovimento.Text) <> '' then
    MEDescBcoMovimento.Text := DMOracle.BuscaNome('SELECT NUM_CHEQUE FROM TB_BCO_MOVIMENTO','WHERE COD_BCO_MOVIMENTO = ' + trim(MEBcoMovimento.Text))
  else
    MEDescBcoMovimento.Text := '';
end;

procedure TFAdiantamentoCons.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FBancoMovCons = nil then
    FBancoMovCons := TFBancoMovCons.create(application);

  if FBancoMovCons.showmodal = mrok then
  begin
    MEBcoMovimento.Text := DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Text;
    MEBcoMovimentoExit(sender);
  end;
end;

procedure TFAdiantamentoCons.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    MECadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    MECadastroExit(sender);
  end;
end;

procedure TFAdiantamentoCons.MECadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(MECadastro.Text) <> '' then
    MEDescCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + Trim(MECadastro.Text))
  else
    MEDescCadastro.Text := '';
end;

procedure TFAdiantamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMAdiantamento.QAdiantamentoCons.Close;
  if Trim(METexto.Text) <> '' then
    DMAdiantamento.QAdiantamentoCons.SetVariable('COD_CAIXA_MOV',Trim(METexto.text))
  else
    DMAdiantamento.QAdiantamentoCons.SetVariable('COD_CAIXA_MOV',null);

  if Trim(MEBcoMovimento.text) <> '' then
    DMAdiantamento.QAdiantamentoCons.SetVariable('COD_BCO_MOVIMENTO',Trim(MEBcoMovimento.Text))
  else
    DMAdiantamento.QAdiantamentoCons.SetVariable('COD_BCO_MOVIMENTO',null);

  if Trim(MECadastro.text) <> '' then
    DMAdiantamento.QAdiantamentoCons.SetVariable('COD_CADASTRO',Trim(MECadastro.text))
  else
    DMAdiantamento.QAdiantamentoCons.SetVariable('COD_CADASTRO',null);
  Case RgTipoAdiantamento.ItemIndex of
    0 : DMAdiantamento.QAdiantamentoCons.SetVariable('IND_OPERACAO','+');
    1 : DMAdiantamento.QAdiantamentoCons.SetVariable('IND_OPERACAO','-');
    2 : DMAdiantamento.QAdiantamentoCons.SetVariable('IND_OPERACAO',Null);
  End;
  DMAdiantamento.QAdiantamentoCons.SetVariable('DT_INICIAL',MeDtInicial.Text);
  DMAdiantamento.QAdiantamentoCons.SetVariable('DT_FINAL',MeDtFinal.Text);
  DMAdiantamento.QAdiantamentoCons.Open;

end;

procedure TFAdiantamentoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
