unit UProdutoAgricolaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Menus, Db, ComCtrls, Mask,
  Buttons, ExtCtrls, DBDirceu, variants, Grids, DBGrids, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFProdutoAgricolaCad = class(TFTCadSimples)
    RelatriodeProdutosAgrcolas1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label2: TLabel;
    LblFixar: TLabel;
    LblFixacao: TLabel;
    Label11: TLabel;
    LblContratoGp: TLabel;
    LblContratoCf: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    LblContratoGpDolar: TLabel;
    Label37: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    BtConsProduto: TBitBtn;
    DBEdit24: TDBEdit;
    BtConsTributacao: TBitBtn;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    BtAFixar: TBitBtn;
    BtFixacao: TBitBtn;
    DBEdit8: TDBEdit;
    BtAFixarConsumo: TBitBtn;
    DBEdit14: TDBEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit20: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    BitBtn2: TBitBtn;
    DBEdit37: TDBEdit;
    BitBtn3: TBitBtn;
    DBEdit39: TDBEdit;
    BitBtn4: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    DBDirceu8: TDBDirceu;
    DBDirceu9: TDBDirceu;
    DBEdit2: TDBEdit;
    DBEdit11: TDBEdit;
    BitBtn5: TBitBtn;
    DBEdit17: TDBEdit;
    DBEdit25: TDBEdit;
    DBDirceu10: TDBDirceu;
    DBEdit28: TDBEdit;
    BitBtn6: TBitBtn;
    DBDirceu11: TDBDirceu;
    DBEdit29: TDBEdit;
    BitBtn7: TBitBtn;
    DBDirceu12: TDBDirceu;
    DSProdutoAgricolaFilial: TDataSource;
    Label8: TLabel;
    DBEdit36: TDBEdit;
    Label14: TLabel;
    DBEdit38: TDBEdit;
    Label24: TLabel;
    DBEdit40: TDBEdit;
    Label29: TLabel;
    DBEdit41: TDBEdit;
    Label36: TLabel;
    DBEdit42: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBDirceu13: TDBDirceu;
    BtConsFilial: TBitBtn;
    DBDirceu14: TDBDirceu;
    DBRadioGroup2: TDBRadioGroup;
    procedure BtConsProdutoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure BtAFixarClick(Sender: TObject);
    procedure BtFixacaoClick(Sender: TObject);
    procedure BtAFixarConsumoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RelatriodeProdutosAgrcolas1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure DBEdit38Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoAgricolaCad: TFProdutoAgricolaCad;

implementation

uses UProdutoAgricola_cl, UProdutoCons, UProduto_cl, UProdutoAgricolaCons,
  UTributacaoCons, UTributacao_cl, UOperacaoCons, UOperacao_cl,
  UProdutoAgricolaParam, URProdutoAgricola, UFmTributacao, UOracle_cl,
  UParamSistema_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFProdutoAgricolaCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
end;

procedure TFProdutoAgricolaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FProdutoAgricolaCons = nil then
     FProdutoAgricolaCons := TFProdutoAgricolaCons.Create(Application);
  If FProdutoAgricolaCons.ShowModal = mrOK then
     with DMProdutoAgricola do
     begin
        QProdutoAgricola.Close;
        QProdutoAgricola.setVariable('PK',QProdutoAgricolaConsCod_Produto.Value);
        QProdutoAgricola.Open;
     end;
end;

procedure TFProdutoAgricolaCad.FormActivate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
   Begin
     LblFixar.Caption := 'Oper. Remessa depósito(Produtor)';
     LblFixacao.Caption := 'Oper. Compra Produtor';
     LblContratoGp.Caption := 'Oper. Compra Contrato Garantia Preço';
     LblContratoGpDolar.Caption := 'Oper. Compra Contrato Garantia Preço Dólar';
     LblContratoCf.Caption := 'Oper. Compra Contrato Compra Futura';
   End;
  DMProdutoAgricola.QProdutoAgricola.Open;
  DMProdutoAgricola.QProdutoAgricolaFilial_Cad.Open;
end;

procedure TFProdutoAgricolaCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = nil then
     FTributacaoCons := TFTributacaoCons.Create(Application);
  If FtributacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;

end;

procedure TFProdutoAgricolaCad.BtAFixarClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Operacao_AFixar.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;


end;

procedure TFProdutoAgricolaCad.BtFixacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Operacao_Fixacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFProdutoAgricolaCad.BtAFixarConsumoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Operacao_aFixar_Consumo.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFProdutoAgricolaCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCOD_OPERACAO_FIXACAO_GP_US.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
End;

procedure TFProdutoAgricolaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (4);
end;

procedure TFProdutoAgricolaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProdutoAgricola.QProdutoAgricola.Close;
  DMProdutoAgricola.QProdutoAgricolaFilial_Cad.Close;
  Action := CaFree;
  FProdutoAgricolaCad := Nil;
end;

procedure TFProdutoAgricolaCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Oper_Fixacao_Contrato_cf.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFProdutoAgricolaCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Operacao_Transferencia.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFProdutoAgricolaCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCOD_OPER_TRANSF_ENTRADA.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFProdutoAgricolaCad.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Produto_Fita.Text := DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFProdutoAgricolaCad.RelatriodeProdutosAgrcolas1Click(
  Sender: TObject);
begin
  inherited;
  if FProdutoAgricolaParam =  nil then
    FProdutoAgricolaParam := TFProdutoAgricolaParam.Create(Application);
//  FProdutoAgricolaParam.PGRelatorio.Pages[0].TabVisible := True;
  FProdutoAgricolaParam.PGRelatorio.ActivePageIndex := 1;
  if FProdutoAgricolaParam.ShowModal = MrOk then
    with DMProdutoAgricola do
    begin
      if Trim(FProdutoAgricolaParam.Fm0Produto.MeProduto.Text) = '' then
        QRProdutoAgricola.SetVariable('COD_PRODUTO', null)
      else
        QRProdutoAgricola.SetVariable('COD_PRODUTO', Trim(FProdutoAgricolaParam.Fm0Produto.MeProduto.Text));

      if Trim(FProdutoAgricolaParam.Fm0Tributacao.MeTributacao.Text) = '' then
        QRProdutoAgricola.SetVariable('COD_TRIBUTACAO', null)
      else
        QRProdutoAgricola.SetVariable('COD_TRIBUTACAO', Trim(FProdutoAgricolaParam.Fm0Tributacao.MeTributacao.Text));

      if FRProdutoAgricola = nil then
        FRProdutoAgricola := TFRProdutoAgricola.Create(Application);
      FRProdutoAgricola.QRLProduto.Caption := FProdutoAgricolaParam.Fm0Produto.EdProduto.Text;
      FRProdutoAgricola.QRLTributacao.Caption := FProdutoAgricolaParam.Fm0Tributacao.EdTributacao.Text;

      QRProdutoAgricola.open;
      if FProdutoAgricolaParam.RGPreview.ItemIndex = 0 then
         FRProdutoAgricola.QRPrimario.Preview
      else
         FRProdutoAgricola.QRPrimario.Print;

      QRProdutoAgricola.Close;
    end;
end;

procedure TFProdutoAgricolaCad.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaCod_Operacao_Devolucao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFProdutoAgricolaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMProdutoAgricola.QProdutoAgricolaFilial_CadCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFProdutoAgricolaCad.DBEdit38Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit38.Text);
end;

end.
