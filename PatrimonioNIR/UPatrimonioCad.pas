unit UPatrimonioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, OracleNavigator, Grids, DBGrids, VARIANTS, ActnList;

type
  TFPatrimonioCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    BtConsFilial: TBitBtn;
    BtConsCadastro: TBitBtn;
    BtConsUsuario: TBitBtn;
    BtConsDepartamento: TBitBtn;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DsPatrimonio_Item: TDataSource;
    Label15: TLabel;
    DBEdit18: TDBEdit;
    Label16: TLabel;
    DBEdit19: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    DBGrid1: TDBGrid;
    RelaoPatrimnio1: TMenuItem;
    RelaoFichaPatrimnio1: TMenuItem;
    TabSheet3: TTabSheet;
    Label23: TLabel;
    DBEdit27: TDBEdit;
    BtConsTipo: TBitBtn;
    DBEdit28: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    Label17: TLabel;
    DBEdit23: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsUsuarioClick(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoPatrimnio1Click(Sender: TObject);
    procedure RelaoFichaPatrimnio1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DsPatrimonio_ItemStateChange(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BtConsTipoClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonioCad: TFPatrimonioCad;

implementation

uses Upatrimonio_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UUsuarioCons, UUsuario_cl, UDepartamentoCons, UDepartamento_cl,
  UpatrimonioCons, URPatrimonio, UPatrimonio_Param, UrPatrimonioFicha,
  UOracle_cl, UTipoEquipamentoCons, UTipoEquipamento_cl,
  UPatrimonioItemCons;

{$R *.DFM}

procedure TFPatrimonioCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DmPatrimonio do
  Begin
    QPatrimonio.Close;
    QPatrimonio_Item.Close;
    QPatrimonio.Open;
    QPatrimonio_Item.Open;
  End;
end;

procedure TFPatrimonioCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFPatrimonioCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFPatrimonioCad.BtConsUsuarioClick(Sender: TObject);
begin
  inherited;
  If FUsuarioCons = Nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioCod_Usuario.Value := DMUsuario.QUsuarioConsCod_Usuario.Value;

end;

procedure TFPatrimonioCad.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    DMPatrimonio.QPatrimonioCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFPatrimonioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioCons = Nil then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If FPatrimonioCons.ShowModal = mrOk then
  With DMPatrimonio do
  Begin
    QPatrimonio.Close;
    QPatrimonio.SetVariable('PK',QPatrimonio_ConsCod_Patrimonio.Value);
    QPatrimonio.Open;
  End;

end;

procedure TFPatrimonioCad.RelaoPatrimnio1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonio_Param = Nil then
    FPatrimonio_Param := TFPatrimonio_Param.Create(Application);
  FPatrimonio_Param.PGRelatorio.Pages[0].TabVisible := True;
  if FPatrimonio_Param.ShowModal = mrOk then
  with DMPatrimonio do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPatrimonio_Param.ME1Filial.Text),'PATRIMONIO');
    QRPatrimonio.Close;
    if Trim(FPatrimonio_Param.ME1Filial.Text) = '' then
      QRPatrimonio.SetVariable('COD_FILIAL',Null)
    else
      QRPatrimonio.SetVariable('COD_FILIAL',FPatrimonio_Param.ME1Filial.Text);
    if Trim(FPatrimonio_Param.ME1Cadastro.Text) = '' then
      QRPatrimonio.SetVariable('COD_CADASTRO',Null)
    else
      QRPatrimonio.SetVariable('COD_CADASTRO',FPatrimonio_Param.ME1Cadastro.Text);
    if Trim(FPatrimonio_Param.ME1Departamento.Text) = '' then
      QRPatrimonio.SetVariable('COD_DEPARTAMENTO',Null)
    else
      QRPatrimonio.SetVariable('COD_DEPARTAMENTO',FPatrimonio_Param.ME1Departamento.Text);
    Case FPatrimonio_Param.Rg1Situacao.ItemIndex Of
      0 : QRPatrimonio.SetVariable('SITUACAO','ATIVO');
      1 : QRPatrimonio.SetVariable('SITUACAO','VENDIDO');
      2 : QRPatrimonio.SetVariable('SITUACAO','BAIXADO');
      3 : QRPatrimonio.SetVariable('SITUACAO',Null);
    End;
    QRPatrimonio.Open;

    if FRPatrimonio = Nil then
      FRPatrimonio := TFRPatrimonio.Create(Application);

    if FPatrimonio_Param.RGPreview.ItemIndex = 0 then
      FRPatrimonio.QRPrimario.Preview
    Else
      FRPatrimonio.QRPrimario.Print;
    QRPatrimonio.Close;
  End;
end;

procedure TFPatrimonioCad.RelaoFichaPatrimnio1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonio_Param = Nil then
    FPatrimonio_Param := TFPatrimonio_Param.Create(Application);
  FPatrimonio_Param.PGRelatorio.Pages[1].TabVisible := True;
  if FPatrimonio_Param.ShowModal = mrOk then
  with DMPatrimonio do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPatrimonio_Param.ME2Filial.Text),'PATRIMONIO');
    QRPatrimonioFicha.Close;
    if Trim(FPatrimonio_Param.ME2Patrimonio.Text) = '' then
      QRPatrimonioFicha.SetVariable('COD_PAT',Null)
    else
      QRPatrimonioFicha.SetVariable('COD_PAT',FPatrimonio_Param.ME2Patrimonio.Text);
    if Trim(FPatrimonio_Param.ME2Filial.Text) = '' then
      QRPatrimonioFicha.SetVariable('COD_FILIAL',Null)
    else
      QRPatrimonioFicha.SetVariable('COD_FILIAL',FPatrimonio_Param.ME2Filial.Text);
    if Trim(FPatrimonio_Param.ME2Cadastro.Text) = '' then
      QRPatrimonioFicha.SetVariable('COD_CADASTRO',Null)
    else
      QRPatrimonioFicha.SetVariable('COD_CADASTRO',FPatrimonio_Param.ME2Cadastro.Text);
    if Trim(FPatrimonio_Param.ME2Departamento.Text) = '' then
      QRPatrimonioFicha.SetVariable('COD_DEPARTAMENTO',Null)
    else
      QRPatrimonioFicha.SetVariable('COD_DEPARTAMENTO',FPatrimonio_Param.ME2Departamento.Text);
    Case FPatrimonio_Param.Rg2Situacao.ItemIndex Of
      0 : QRPatrimonioFicha.SetVariable('SITUACAO','ATIVO');
      1 : QRPatrimonioFicha.SetVariable('SITUACAO','VENDIDO');
      2 : QRPatrimonioFicha.SetVariable('SITUACAO','BAIXADO');
      3 : QRPatrimonioFicha.SetVariable('SITUACAO',Null);
    End;
    QRPatrimonioFicha.Open;

    If FRPatrimonioFicha = Nil then
      FRPatrimonioFicha := TFRPatrimonioFicha.Create(Application);

    If FPatrimonio_Param.RGPreview.ItemIndex = 0 then
      FRPatrimonioFicha.QRPrimario.Preview
    Else
      FRPatrimonioFicha.QRPrimario.Print;
    QRPatrimonioFicha.Close;
  End;

end;

procedure TFPatrimonioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      BtConsFilial.Enabled:=True;
      BtConsDepartamento.Enabled:=True;
      BtConsUsuario.Enabled:=True;
      BtConsCadastro.Enabled:=True;
    end
  Else
    begin
      BtConsFilial.Enabled:=False;
      BtConsDepartamento.Enabled:=False;
      BtConsUsuario.Enabled:=False;
      BtConsCadastro.Enabled:=False;
    end;

end;

procedure TFPatrimonioCad.DsPatrimonio_ItemStateChange(Sender: TObject);
begin
  inherited;
  If DSPatrimonio_Item.State in [DSInsert,DSEdit] then
    begin
      BtConsTipo.Enabled:=True;
    end
  Else
    begin
      BtConsTipo.Enabled:=False;
    end;

end;

procedure TFPatrimonioCad.DBEdit1Exit(Sender: TObject);
// Var wCodigo : String;
begin
  inherited;
//  wCodigo := DMOracle.BuscaNome('SELECT COD_PATRIMONIO FROM TB_PATRIMONIO','COD_PATRIMONIO = '+FloatToStr(DMPatrimonio.QPatrimonioCod_Patrimonio.Value));
//  If wCodigo <> '' Then
//     Raise Exception.Create ('Patrimônio Já Cadastrado');
end;

procedure TFPatrimonioCad.BtConsTipoClick(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCons = Nil then
    FTipoEquipamentoCons := TFTipoEquipamentoCons.Create(Application);
  If FTipoEquipamentoCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonio_ItemCod_Tipo_Equipamento.Value := DMTipoEquipamento.QTipoEquipamentoConsCod_Tipo_Equipamento.Value;

end;

procedure TFPatrimonioCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  DMPatrimonio.QCaracteristicas_All.Close;
  DMPatrimonio.QPatrimonio_Caracteristicas.Close;
  DMPatrimonio.QCaracteristicas_All.Open;
  DMPatrimonio.QPatrimonio_Caracteristicas.Open;

end;

procedure TFPatrimonioCad.BitBtn1Click(Sender: TObject);
Var wConteudo : String;
begin
  inherited;
  Try
    wConteudo := InputBox('Informe Conteúdo', 'Conteúdo', '');
    DMOracle.DBCemapa.StartTransaction;
    With DMPatrimonio do
    Begin
      QPatrimonio_Item_Carac.Close;
      QPatrimonio_Item_Carac.Open;
      QPatrimonio_Item_Carac.Insert;
      QPatrimonio_Item_CaracCod_Patrimonio.Value := QPatrimonioCod_Patrimonio.Value;
      QPatrimonio_Item_CaracCod_Patrimonio_Item.Value := QPatrimonio_ItemCod_Patrimonio_Item.Value;
      QPatrimonio_Item_CaracCod_Tipo_Equipamento_Carac.Value := QCaracteristicas_AllCod_Tipo_Equipamento_Carac.Value;
      QPatrimonio_Item_CaracDesc_Conteudo.Value := wConteudo;
      QPatrimonio_Item_Carac.Post;
    End;
    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonio_Item_Carac.Close;
    DMPatrimonio.QPatrimonio_Caracteristicas.Close;
    DMPatrimonio.QPatrimonio_Caracteristicas.Open;
  Except
    DMPatrimonio.QPatrimonio_Item_Carac.Cancel;
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create ('Erro no Lançamento ');
  End;
end;

procedure TFPatrimonioCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Try
    DMOracle.DBCemapa.StartTransaction;
    With DMPatrimonio do
    Begin
      QPatrimonio_Item_Carac.Close;
      QPatrimonio_Item_Carac.SetVariable('Cod_Patrimonio',QPatrimonioCod_Patrimonio.Value);
      QPatrimonio_Item_Carac.SetVariable('Cod_Patrimonio_Item',QPatrimonio_ItemCod_Patrimonio_Item.Value);
      QPatrimonio_Item_Carac.SetVariable('Cod_Tipo_Equipamento_Carac',QPatrimonio_CaracteristicasCod_Tipo_Equipamento_Carac.Value);
      QPatrimonio_Item_Carac.Open;
      If Not QPatrimonio_Item_Carac.Eof Then
         QPatrimonio_Item_Carac.Delete;
    End;
    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonio_Item_Carac.Close;
    DMPatrimonio.QPatrimonio_Caracteristicas.Close;
    DMPatrimonio.QPatrimonio_Caracteristicas.Open;
  Except
    DMPatrimonio.QPatrimonio_Item_Carac.Cancel;
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create ('Erro na Exclusão ');
  End;

end;

procedure TFPatrimonioCad.DBGrid3DblClick(Sender: TObject);
Var wConteudo : String;
begin
  inherited;
  If DMPatrimonio.QPatrimonio_CaracteristicasCod_Patrimonio.Text <> '' Then
  Begin
    Try
      With DMPatrimonio do
      Begin
        DMOracle.DBCemapa.StartTransaction;
        QPatrimonio_Item_Carac.Close;
        QPatrimonio_Item_Carac.SetVariable('Cod_Patrimonio',QPatrimonio_CaracteristicasCod_Patrimonio.Value);
        QPatrimonio_Item_Carac.SetVariable('Cod_Patrimonio_Item',QPatrimonio_CaracteristicasCod_Patrimonio_Item.Value);
        QPatrimonio_Item_Carac.SetVariable('Cod_Tipo_Equipamento_Carac',QPatrimonio_CaracteristicasCod_Tipo_Equipamento_Carac.Value);
        QPatrimonio_Item_Carac.Open;
        wConteudo := QPatrimonio_Item_CaracDesc_Conteudo.Value;
        wConteudo := InputBox('Informe Conteúdo', 'Conteúdo', wConteudo);
        QPatrimonio_Item_Carac.Edit;
        QPatrimonio_Item_CaracDesc_Conteudo.Value := wConteudo;
        QPatrimonio_Item_Carac.Post;
        DMOracle.DBCemapa.Commit;
        DMPatrimonio.QPatrimonio_Item_Carac.Close;
        DMPatrimonio.QPatrimonio_Caracteristicas.Close;
        DMPatrimonio.QPatrimonio_Caracteristicas.Open;
      End;
    Except
      DMPatrimonio.QPatrimonio_Item_Carac.Cancel;
      DMOracle.DBCemapa.RollBack;
      Raise Exception.Create ('Erro no Lançamento ');
    End;
  End;
end;

procedure TFPatrimonioCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonioItemCons = Nil then
    FPatrimonioItemCons := TFPatrimonioItemCons.Create(Application);
  If FPatrimonioItemCons.ShowModal = mrOk then
  With DMPatrimonio do
  Begin
    QPatrimonio.Close;
    QPatrimonio.SetVariable('PK',QPatrimonio_Item_ConsCod_Patrimonio.Value);
    QPatrimonio.Open;
  End;

end;

procedure TFPatrimonioCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMPatrimonio.QPatrimonioCOD_FILIAL.Text),'PATRIMONIO');
  inherited;
end;

end.
