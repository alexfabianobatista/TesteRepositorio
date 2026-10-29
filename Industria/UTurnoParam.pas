unit UTurnoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TFTurnoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    ME0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    ME0Turno: TMaskEdit;
    Bt0ConsTurno: TBitBtn;
    Ed0Turno: TEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Me1Filial: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed1Filial: TEdit;
    Label2: TLabel;
    Me1Turno: TMaskEdit;
    BitBtn2: TBitBtn;
    Ed1Turno: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    Label5: TLabel;
    ME1Produto: TMaskEdit;
    BtConsProduto: TBitBtn;
    Ed1Produto: TEdit;
    TabSheet3: TTabSheet;
    Label10: TLabel;
    Me2Filial: TMaskEdit;
    BtFilialCons: TBitBtn;
    Ed2Filial: TEdit;
    BtTurnoCons: TBitBtn;
    Ed2Turno: TEdit;
    Me2Turno: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    Me2Produto: TMaskEdit;
    Bt2ConsProd: TBitBtn;
    Ed2Produto: TEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    Rg0TipoProduto: TRadioGroup;
    TabSheet4: TTabSheet;
    Me3Turno: TMaskEdit;
    Bt3TurnoCons: TBitBtn;
    Ed3Turno: TEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ME3DataI: TMaskEdit;
    ME3DataF: TMaskEdit;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure Bt0ConsTurnoClick(Sender: TObject);
    procedure ME0TurnoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure Me1TurnoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtFilialConsClick(Sender: TObject);
    procedure BtTurnoConsClick(Sender: TObject);
    procedure Bt2ConsProdClick(Sender: TObject);
    procedure Me2FilialExit(Sender: TObject);
    procedure Me2TurnoExit(Sender: TObject);
    procedure Me2ProdutoExit(Sender: TObject);
    procedure Me3TurnoExit(Sender: TObject);
    procedure Bt3TurnoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
   
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTurnoParam: TFTurnoParam;

implementation

uses UUsuario_cl, UFilial_cl, UFilialCons, UTurnoCons, UTurno_cl,
  UProdutoCons, UFormula_cl, UProduto_cl;

{$R *.DFM}

procedure TFTurnoParam.FormCreate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME0DataI.Text := DateToStr(Date-30);
  ME0DataF.Text := DateToStr(Date);
end;

procedure TFTurnoParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0Filial.Text);
    QFilial.Open;
    Ed0Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed0Filial.Text := 'Todas';
end;

procedure TFTurnoParam.Bt0ConsFilialClick(Sender: TObject);
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

procedure TFTurnoParam.Bt0ConsTurnoClick(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  Begin
    ME0Turno.Text := DMTurno.QTurnoAllCod_Turno.Text;
    ME0TurnoExit(Self);
  End;
end;

procedure TFTurnoParam.ME0TurnoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Turno.Text) <> '' Then
  With DMTurno do
  Begin
    QTurno.Close;
    QTurno.SetVariable('PK',ME0Turno.Text);
    QTurno.Open;
    Ed0Turno.Text := QTurnoDesc_Turno.Text;
  End
  Else
    Ed0Turno.Text := 'Todos';
end;

procedure TFTurnoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me1FilialExit(Self);
  End;

end;

procedure TFTurnoParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  Begin
    ME1Turno.Text := DMTurno.QTurnoAllCod_Turno.Text;
    ME1TurnoExit(Self);
  End;

end;

procedure TFTurnoParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',Me1Filial.Text);
    QFilial.Open;
    Ed1Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed1Filial.Text := 'Todas';

end;

procedure TFTurnoParam.Me1TurnoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Turno.Text) <> '' Then
  With DMTurno do
  Begin
    QTurno.Close;
    QTurno.SetVariable('PK',ME1Turno.Text);
    QTurno.Open;
    Ed1Turno.Text := QTurnoDesc_Turno.Text;
  End
  Else
    Ed1Turno.Text := 'Todos';

end;

procedure TFTurnoParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
//  If FProdutoCons = Nil then
//    FProdutoCons := TFProdutoCons.Create(Application);
//  If FProdutoCons.ShowModal = mrOk then
//    Me1Produto.Text := DMProduto.QProdutoConsCod_Produto.Value;

end;

procedure TFTurnoParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Produto.Text) <> '' Then
  With DMProduto do
  Begin
    QProduto.Close;
    QProduto.SetVariable('PK',ME1Produto.Text);
    QProduto.Open;
    Ed1Produto.Text := QProdutoDesc_Produto.Value;
  End
  Else
    Ed1Produto.Text := 'Todos';

end;

procedure TFTurnoParam.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME1ProdutoExit(Self);
  End;

end;

procedure TFTurnoParam.BtFilialConsClick(Sender: TObject);
begin
  inherited;
If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me2FilialExit(Self);
  End;
end;

procedure TFTurnoParam.BtTurnoConsClick(Sender: TObject);
begin
  inherited;
If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  Begin
    ME2Turno.Text := DMTurno.QTurnoAllCod_Turno.Text;
    ME2TurnoExit(Self);

  end;
  
end;

procedure TFTurnoParam.Bt2ConsProdClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  begin
    ME2Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME2ProdutoExit(Self);
  end;

end;

procedure TFTurnoParam.Me2FilialExit(Sender: TObject);
begin
  inherited;
If Trim(Me2Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',Me2Filial.Text);
    QFilial.Open;
    Ed2Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed2Filial.Text := 'Todas';
end;

procedure TFTurnoParam.Me2TurnoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Turno.Text) <> '' Then
  With DMTurno do
  Begin
    QTurno.Close;
    QTurno.SetVariable('PK',ME2Turno.Text);
    QTurno.Open;
    Ed2Turno.Text := QTurnoDesc_Turno.Text;
  End
  Else
    Ed2Turno.Text := 'Todos';

end;

procedure TFTurnoParam.Me2ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Produto.Text) <> '' Then
  With DMProduto do
  Begin
    QProduto.Close;
    QProduto.SetVariable('PK',ME2Produto.Text);
    QProduto.Open;
    Ed2Produto.Text := QProdutoDesc_Produto.Value;
  End
  Else
    Ed2Produto.Text := 'Todos';

end;

procedure TFTurnoParam.Me3TurnoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Turno.Text) <> '' Then
  With DMTurno do
  Begin
    QTurno.Close;
    QTurno.SetVariable('PK',ME3Turno.Text);
    QTurno.Open;
    Ed3Turno.Text := QTurnoDesc_Turno.Text;
  End
  Else
    Ed3Turno.Text := 'Todos';


end;

procedure TFTurnoParam.Bt3TurnoConsClick(Sender: TObject);
begin
  inherited;
If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  Begin
    ME3Turno.Text := DMTurno.QTurnoAllCod_Turno.Text;
    ME3TurnoExit(Self);

  end;

end;

procedure TFTurnoParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me2Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

end.

