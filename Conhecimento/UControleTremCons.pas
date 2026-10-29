unit UControleTremCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  DBCtrls, DBDirceu, ExtCtrls, ActnList, ComCtrls, Menus;

type
  TFControleTremCons = class(TFTConsulta)
    GroupBox1: TGroupBox;
    MeDTInicial: TMaskEdit;
    Label3: TLabel;
    MeDTFinal: TMaskEdit;
    BtDestinatario: TBitBtn;
    EdRemetente: TEdit;
    Label7: TLabel;
    MeProduto: TMaskEdit;
    BtProduto: TBitBtn;
    EdProduto: TEdit;
    Label2: TLabel;
    MeFilial: TMaskEdit;
    BtFilial: TBitBtn;
    EdFilial: TEdit;
    Label4: TLabel;
    MeFluxo: TMaskEdit;
    MeCadastroOrigem: TMaskEdit;
    SbBuscaCadastroOrigem: TSpeedButton;
    lblOrigem: TLabel;
    EdOrigem: TEdit;
    RgModal: TRadioGroup;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtDestinatarioClick(Sender: TObject);
    procedure SbBuscaCadastroOrigemClick(Sender: TObject);
    procedure MeCadastroOrigemExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleTremCons: TFControleTremCons;

implementation

uses UControleTrem_cl, UCadastroCons, UCadastro_cl, UOracle_cl,
  UNotaEntradaCons, UNotaEntrada_cl, UProdutoCons, UProduto_cl,
  UNotaSaidaCons, UNotaSaida_cl, UFilialCons, UFilial_cl,
  UImpressoraFiscal;

{$R *.dfm}

procedure TFControleTremCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMControleTrem do
  begin
    QControleTremCons.Close;
    if Trim(MeTexto.Text) <> '' then
      QControleTremCons.SetVariable('COD_DESTINATARIO', Trim(MeTexto.Text))
    else
      QControleTremCons.SetVariable('COD_DESTINATARIO', null);

    if Trim(MeCadastroOrigem.Text) <> '' then
      QControleTremCons.SetVariable('COD_ORIGEM', Trim(MeCadastroOrigem.Text))
    else
      QControleTremCons.SetVariable('COD_ORIGEM', null);

    if Trim(MeProduto.Text) <> '' then
      QControleTremCons.SetVariable('COD_PRODUTO', Trim(MeProduto.Text))
    else
      QControleTremCons.SetVariable('COD_PRODUTO', null);

    if Trim(MeFilial.Text) <> '' then
      QControleTremCons.SetVariable('COD_FILIAL', Trim(MeFilial.Text))
    else
      QControleTremCons.SetVariable('COD_FILIAL', null);

    if Trim(MeFluxo.Text) <> '' then
      QControleTremCons.SetVariable('DESC_FLUXO', Trim(MeFluxo.Text))
    else
      QControleTremCons.SetVariable('DESC_FLUXO', null);
     
    Case RgModal.ItemIndex of
      0 : QControleTremCons.SetVariable('MODAL','F');
      1 : QControleTremCons.SetVariable('MODAL','R/F');
      2 : QControleTremCons.SetVariable('MODAL', null);
    End;

    if Trim(MeDTInicial.Text) <> '' then
      QControleTremCons.SetVariable('DATA_I', Trim(MeDTInicial.Text))
    else
      Raise exception.Create('Informar Data Acordo Inicial');

    if Trim(MeDTFinal.Text) <> '' then
      QControleTremCons.SetVariable('DATA_F', Trim(MeDTFinal.Text))
    else
      Raise exception.Create('Informar Data Acordo Final');

    QControleTremCons.Open;
  end;
end;

procedure TFControleTremCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeTexto.Text) <> '' then
  begin
    EdRemetente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' +
                                           MeTexto.Text);
  end;
end;

procedure TFControleTremCons.MeProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeProduto.Text) <> '' then
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' +
                                          MeProduto.Text, true);
end;

procedure TFControleTremCons.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
   if FProdutoCons.ShowModal = MrOk then
   begin
     MeProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
     MeProdutoExit(Self);
   end;
end;

procedure TFControleTremCons.MeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MeFilial.Text) <> '' then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MeFilial.Text, true);

end;

procedure TFControleTremCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
   if FFilialCons.ShowModal = MrOk then
   begin
     MeFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
     MeFilialExit(Self);
   end;

end;

procedure TFControleTremCons.BtDestinatarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
   if FCadastroCons.ShowModal = MrOk then
   begin
     MeTexto.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     MeTextoExit(Self);
   end;

end;

procedure TFControleTremCons.SbBuscaCadastroOrigemClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
  begin
    MeCadastroOrigem.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    MeCadastroOrigemExit(Self);
  end;
end;

procedure TFControleTremCons.MeCadastroOrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCadastroOrigem.Text) <> '' then
  begin
    EdOrigem.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' +
                                           MeCadastroOrigem.Text);
  end;
end;

procedure TFControleTremCons.FormActivate(Sender: TObject);
begin
  inherited;
  MeDTInicial.Text := DateToStr(Date - 180); //Data Atual menos 6 meses. -- Camila 19/10/2007
  MeDTFinal.Text   := DateToStr(Date);
end;

procedure TFControleTremCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
