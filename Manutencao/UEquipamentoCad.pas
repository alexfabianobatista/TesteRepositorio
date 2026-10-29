unit UEquipamentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFEquipamentoCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TSEquipamento: TTabSheet;
    TabSheet2: TTabSheet;
    FichaTcnica1: TMenuItem;
    SpeedButton3: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BTDepartamento: TBitBtn;
    DBEdit19: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit17: TDBEdit;
    BTFilial: TBitBtn;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BTFornecedor: TBitBtn;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label10: TLabel;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit21: TDBEdit;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    Label21: TLabel;
    DBEdit23: TDBEdit;
    Label22: TLabel;
    DBEdit24: TDBEdit;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    DBNavigator1: TDBNavigator;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    BTTipoEquipamento: TBitBtn;
    DBEdit20: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label17: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid3: TDBGrid;
    Bevel1: TBevel;
    Label23: TLabel;
    DBEdit25: TDBEdit;
    Label24: TLabel;
    DBEdit26: TDBEdit;
    DBEdit28: TDBEdit;
    BTProdutoCons4: TBitBtn;
    DBNavigator2: TDBNavigator;
    DBGrid4: TDBGrid;
    Label25: TLabel;
    DBEdit27: TDBEdit;
    Label26: TLabel;
    DBEdit29: TDBEdit;
    Label27: TLabel;
    DBEdit30: TDBEdit;
    BTProdutoCons6: TBitBtn;
    DBNavigator3: TDBNavigator;
    DBGrid5: TDBGrid;
    DBEdit31: TDBEdit;
    Label28: TLabel;
    DBEdit32: TDBEdit;
    Label29: TLabel;
    DBEdit33: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTFilialClick(Sender: TObject);
    procedure BTFornecedorClick(Sender: TObject);
    procedure BTDepartamentoClick(Sender: TObject);
    procedure BTTipoEquipamentoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure FichaTcnica1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BTProdutoCons4Click(Sender: TObject);
    procedure BTProdutoCons6Click(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEquipamentoCad: TFEquipamentoCad;

implementation

uses UEquipamento_cl, UDepartamentoCons, UDepartamento_cl, UFilialCons,
  UFilial_cl, UCadastroCons, UCadastro_cl, UTipoEquipamentoCons,
  UTipoEquipamento_cl, UEquipamentoCons, UOracle_cl, UEquipamentoItemCons,
  UEquipamentoParam, URFichaEquipamento, UProdutoCons, UProduto_cl,
  URFichaEquipamentoItem, URFichaEquipamentoPeca;

{$R *.DFM}

procedure TFEquipamentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMEquipamento.QEquipamento.Open;
  DMEquipamento.QEquipamentoItem.Open;
end;

procedure TFEquipamentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action:=caFree;
  FEquipamentoCad:= nil;
  DMEquipamento.QEquipamento.Close;
  DMEquipamento.QEquipamentoItemCons.Close;
  DMEquipamento.QEquipamentoCons.Close;
end;

procedure TFEquipamentoCad.BTFilialClick(Sender: TObject);
begin
  inherited;
  with DMEquipamento do
  begin
    if FFilialCons = nil then
      FFilialCons:= TFFilialCons.Create(Application);
    if FFilialCons.ShowModal = mrOk then
      QEquipamentoCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
  end;
end;

procedure TFEquipamentoCad.BTFornecedorClick(Sender: TObject);
begin
  inherited;
  with DMEquipamento do
  begin
    if FCadastroCons = nil then
      FCadastroCons:= TFCadastroCons.Create(Application);
    if FCadastroCons.ShowModal = mrOk then
      QEquipamentoCod_cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
  end;
end;

procedure TFEquipamentoCad.BTDepartamentoClick(Sender: TObject);
begin
  inherited;
  with DMEquipamento do
  begin
    if FDepartamentoCons = nil then
      FDepartamentoCons:= TFDepartamentoCons.Create(Application);
    if FDepartamentoCons.ShowModal = mrOk then
      QEquipamentoCod_Departamento.Value:=DMDepartamento.QDepartamentoConsCod_Departamento.Value;
  end;
end;

procedure TFEquipamentoCad.BTTipoEquipamentoClick(Sender: TObject);
begin
  inherited;
  with DMEquipamento do
  begin
    if FTipoEquipamentoCons = nil then
      FTipoEquipamentoCons:= TFTipoEquipamentoCons.Create(Application);
    if FTipoEquipamentoCons.ShowModal = mrOk then
      QEquipamentoItemCod_Tipo_Equipamento.Value:=DMTipoEquipamento.QTipoEquipamentoConsCod_Tipo_Equipamento.Value;
  end;
end;

procedure TFEquipamentoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      BtFilial.Enabled:=True;
      BtDepartamento.Enabled:=True;
      BtFornecedor.Enabled:=True;
    end
  Else
    begin
      BtFilial.Enabled:=False;
      BtDepartamento.Enabled:=False;
      BtFornecedor.Enabled:=False;
    end;

end;

procedure TFEquipamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEquipamentoCons = nil then
    FEquipamentoCons:=TFEquipamentoCons.create(Application);
  if FEquipamentoCons.showmodal = mrOk then
  begin
    With DMEquipamento do
    Begin
      QEquipamento.Close;
      QEquipamento.SetVariable('PK',QEquipamentoConsCod_Equipamento_Cab.Value);
      QEquipamento.Open;
    End;
  end;
end;

procedure TFEquipamentoCad.PageControl1Change(Sender: TObject);
begin
  inherited;
 {DMEquipamento.QEquipamentoCarac.Close;
  DMEquipamento.QPatrimonio_Caracteristicas.Close;
  DMEquipamento.QCaracteristicas_All.Open;
  DMEquipamento.QPatrimonio_Caracteristicas.Open;}
end;

procedure TFEquipamentoCad.SpeedButton1Click(Sender: TObject);
var
 wConteudo:String;
begin
  inherited;
  Try
    wConteudo := InputBox('Informe Característica:', 'Conteúdo', '');
    DMOracle.DBCemapa.StartTransaction;
    With DMEquipamento do
    Begin
      QEquipamentoItemCarac.Close;
      QEquipamentoItemCarac.Open;
      QEquipamentoItemCarac.Insert;
      QEquipamentoItemCaracCod_Equipamento_Item.Value := QEquipamentoItemCod_Equipamento_Item.Value;
      QEquipamentoItemCaracCod_Tipo_Equipamento_Carac.Value := QCaracteristicasItemAllCod_Tipo_Equipamento_Carac.Value;
      QEquipamentoItemCaracDesc_Caracteristica.Value := wConteudo;
      QEquipamentoItemCaracCod_Equipamento_cab.Value := QEquipamentoCod_Equipamento_Cab.Value;
      QEquipamentoItemCarac.Post;
    End;
    DMOracle.DBCemapa.Commit;
  Except
    DMEquipamento.QEquipamentoItemCarac.Cancel;
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create ('Erro no Lançamento ');
  End;
end;

procedure TFEquipamentoCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Try
    DMOracle.DBCemapa.StartTransaction;
    With DMEquipamento do
    Begin
      If Not QEquipamentoItemCarac.Eof Then
         QEquipamentoItemCarac.Delete;
    End;
    DMOracle.DBCemapa.Commit;
  Except
    DMEquipamento.QEquipamentoItemCarac.Cancel;
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create ('Erro na Exclusão ');
  End;
end;

procedure TFEquipamentoCad.TabSheet3Show(Sender: TObject);
begin
  inherited;
  With DMEquipamento do
  begin
    QCaracteristicasItemAll.Close;
    QEquipamentoItemCarac.Close;
    if QEquipamentoItemCod_Tipo_equipamento.Text <> '' then
    begin
      QCaracteristicasItemAll.setVariable('COD_TIPO_EQUIPAMENTO',QEquipamentoItemCod_Tipo_equipamento.Text);
      QCaracteristicasItemAll.Open;
      QEquipamentoItemCarac.setVariable('COD_EQUIPAMENTO_ITEM',QEquipamentoItemCod_Equipamento_Item.Text);
      QEquipamentoItemCarac.Open;
    end;
  end;
end;

procedure TFEquipamentoCad.FichaTcnica1Click(Sender: TObject);
begin
  inherited;
 if FEquipamentoParam = Nil then
    FEquipamentoParam := TFEquipamentoParam.Create(Application);
  FEquipamentoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FEquipamentoParam.ShowModal = mrOk then
  with DMEquipamento do
  begin
//    DmUsuario.Checar_Filial_Usuario( Trim(FPatrimonio_Param.ME2Filial.Text),'PATRIMONIO');
    QRFichaEquipamento.Close;
    if Trim(FEquipamentoParam.ME1CodEquipamento.Text) = '' then
      QRFichaEquipamento.SetVariable('COD_EQUIPAMENTO_CAB',Null)
    else
      QRFichaEquipamento.SetVariable('COD_EQUIPAMENTO_CAB',Trim(FEquipamentoParam.ME1CodEquipamento.Text));
    {if Trim(FEquipamentoParam.ME1CodItemEquipamento.Text) = '' then
      QRFichaEquipamento.SetVariable('COD_EQUIPAMENTO_ITEM',Null)
    else
      QRFichaEquipamento.SetVariable('COD_EQUIPAMENTO_ITEM',Trim(FEquipamentoParam.ME1CodItemEquipamento.Text));
      }
    QRFichaEquipamento.Open;

    QRFichaEquipamentoItem.Close;
    QRFichaEquipamentoItem.setVariable('COD_EQUIPAMENTO_CAB',Trim(FEquipamentoParam.ME1CodEquipamento.Text));
    QRFichaEquipamentoItem.Open;

   if FRFichaEquipamentoitem = nil then
      FRFichaEquipamentoitem := TFRFichaEquipamentoitem.create(Application);

    If FRFichaEquipamento = Nil then
      FRFichaEquipamento := TFRFichaEquipamento.Create(Application);
    If FEquipamentoParam.RGPreview.ItemIndex = 0 then
      FRFichaEquipamento.QRCompositeReport1.Preview
    Else
      FRFichaEquipamento.QRCompositeReport1.Print;
    QRFichaEquipamento.Close;
  End;
end;

procedure TFEquipamentoCad.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FEquipamentoItemCons = nil then
    FEquipamentoItemCons:=TFEquipamentoItemCons.create(Application);
  if FEquipamentoItemCons.showmodal = mrOk then
  begin
    With DMEquipamento do
    Begin
      QEquipamento.Close;
      QEquipamento.SetVariable('PK',QEquipamentoItemConsCod_Equipamento_Cab.Value);
      QEquipamento.Open;
    End;
  end;
end;

procedure TFEquipamentoCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with DMEquipamento do
  begin
    if FEquipamentoCons = nil then
      FDepartamentoCons:= TFDepartamentoCons.Create(Application);
    if FDepartamentoCons.ShowModal = mrOk then
      QEquipamentoCod_Departamento.Value:=DMDepartamento.QDepartamentoConsCod_Departamento.Value;
  end;
end;

procedure TFEquipamentoCad.BTProdutoCons4Click(Sender: TObject);
begin
  inherited;
  with DMEquipamento do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      QEquipamentoPecaCod_Produto.Value:=DMProduto.QProdutoConsCod_Produto.Value;
  end;
end;

procedure TFEquipamentoCad.BTProdutoCons6Click(Sender: TObject);
begin
  inherited;
  with DMEquipamento do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      QEquipamentoPecaItemCod_Produto.Value:=DMProduto.QProdutoConsCod_Produto.Value;
  end;
end;

procedure TFEquipamentoCad.TabSheet7Show(Sender: TObject);
begin
  inherited;
  With DMEquipamento do
  begin
    QEquipamentoItemCarac.Close;
    QEquipamentoItemCarac.setVariable('COD_EQUIPAMENTO_ITEM',QEquipamentoItemCod_Equipamento_Item.Value);
    QEquipamentoItemCarac.Open;

    QCaracteristicasItemAll.Close;
    QCaracteristicasItemAll.setVariable('COD_TIPO_EQUIPAMENTO',QEquipamentoItemCod_Tipo_Equipamento.Value);
    QCaracteristicasItemAll.Open;
  end;
end;

end.
