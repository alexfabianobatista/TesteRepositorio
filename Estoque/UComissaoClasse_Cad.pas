unit UComissaoClasse_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFComissaoClasse_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    BtClasse: TSpeedButton;
    BtVendedor: TSpeedButton;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Relatrio1: TMenuItem;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    procedure BtClasseClick(Sender: TObject);
    procedure BtVendedorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComissaoClasse_Cad: TFComissaoClasse_Cad;

implementation

uses UComissaoClasse_cl,UClasseCons, UVendedorCons, UClasse_cl, UOracle_cl,
  UComissaoClasse_Cons, UVendedor_cl, UComissaoClasse_Param,
  UrComissaoClasse;

{$R *.DFM}

procedure TFComissaoClasse_Cad.BtClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    DMComissaoClasse.QComissaoClasseCod_Classe.Value:= DMClasse.QClasseConsCod_Classe.Value;

end;

procedure TFComissaoClasse_Cad.BtVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMComissaoClasse.QComissaoClasseCod_Vendedor.Value:= DMVendedor.QVendedorConsCod_Vendedor.Value;

end;

procedure TFComissaoClasse_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMComissaoClasse.QComissaoClasse.Open;

end;

procedure TFComissaoClasse_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMComissaoClasse.QComissaoClasse.Close;

end;

procedure TFComissaoClasse_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit,DsInsert] then
    begin
      BtClasse.Enabled:=True;
      BtVendedor.Enabled:=True;
    end
  else
    begin
      BtClasse.Enabled:=False;
      BtVendedor.Enabled:=False;
    end;
end;

procedure TFComissaoClasse_Cad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  if DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.Commit;
end;

procedure TFComissaoClasse_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FComissaoClasse_Cons = Nil then
    FComissaoClasse_Cons := TFComissaoClasse_Cons.Create(Application);
  If FComissaoClasse_Cons.ShowModal = mrOk then
  with DMComissaoClasse do
  begin
    QComissaoClasse.Close;
    QComissaoClasse.SetVariable('PK',QComissaoClasseConsCod_Comissao_Classe.Value);
    QComissaoClasse.Open;
  end;

end;

procedure TFComissaoClasse_Cad.Relatrio1Click(Sender: TObject);
begin
  inherited;
  if FComissaoClasse_Param = Nil then
     FComissaoClasse_Param := TFComissaoClasse_Param.Create(Application);
  FComissaoClasse_Param.PGRelatorio.Pages[0].TabVisible:=true;
  if FComissaoClasse_Param.Showmodal = mrOk then
  begin
    with DMComissaoClasse do
    begin
      QRComissaoClasse.Close;
      if Trim(FComissaoClasse_Param.ME0Vendedor.Text) <> '' then
         QRComissaoClasse.SetVariable('COD_VENDEDOR',Trim(FComissaoClasse_Param.ME0Vendedor.Text))
      else
         QRComissaoClasse.SetVariable('COD_VENDEDOR',Null);
      QRComissaoClasse.Open;
      if FRComissaoClasse = nil then
         FRComissaoClasse := TFRComissaoClasse.Create(Application);
      if FComissaoClasse_Param.RGPreview.ItemIndex=0 then
         FRComissaoClasse.QRPrimario.Preview
      else
         FRComissaoClasse.QRPrimario.Print;
      QRComissaoClasse.Close;
    end;
  end;

end;

end.
