unit UPauta_Icms_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFPauta_Icms_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    SbConsProduto: TSpeedButton;
    DBDirceu1: TDBDirceu;
    SbConsEstado: TSpeedButton;
    DBEdit4: TDBEdit;
    Relatrio1: TMenuItem;
    procedure SbConsProdutoClick(Sender: TObject);
    procedure SbConsEstadoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPauta_Icms_Cad: TFPauta_Icms_Cad;

implementation

uses UPauta_Icms_cl, UProdutoCons, UEstadoCons, UProduto_cl, UEstado_cl,
  UPauta_Icms_Cons, UProdutoParam, UUsuario_cl, URPautaICms;

{$R *.DFM}

procedure TFPauta_Icms_Cad.SbConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=mrOk then
     DMPauta_ICMS.QPauta_Icms_CadCod_Produto.Value:=DMProduto.QProdutoConsCod_Produto.Value;
end;

procedure TFPauta_Icms_Cad.SbConsEstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons:=TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal=mrOk then
     DMPauta_ICMS.QPauta_Icms_CadCod_Estado.Value:=DMEstado.QEstadoConsCod_Estado.Value;
end;

procedure TFPauta_Icms_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPauta_ICMS.QPauta_Icms_Cad.Open;
end;

procedure TFPauta_Icms_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPauta_ICMS.QPauta_Icms_Cad.Close;
end;

procedure TFPauta_Icms_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SbConsEstado.Enabled := DsPrimario.State <> DsBrowse;
  SbConsProduto.Enabled := DsPrimario.State <> DsBrowse;
end;

procedure TFPauta_Icms_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPauta_Icms_Cons = Nil then
    FPauta_Icms_Cons := TFPauta_Icms_Cons.Create(Application);
  If FPauta_Icms_Cons.ShowModal = mrOk then
  with DMPauta_Icms do
  begin
    QPauta_Icms_Cad.Close;
    QPauta_Icms_Cad.SetVariable('COD_PRODUTO',QPauta_Icms_ConsCod_Produto.Value);
    QPauta_Icms_Cad.SetVariable('COD_ESTADO',QPauta_Icms_ConsCod_Estado.Value);
    QPauta_Icms_Cad.Open;
  end;

end;

procedure TFPauta_Icms_Cad.Relatrio1Click(Sender: TObject);
begin
  inherited;
  If FProdutoParam = Nil then
    FProdutoParam:=TFProdutoParam.Create(Application);
    FProdutoParam.PGRelatorio.Pages[22].TabVisible:=true;
  If FProdutoParam.Showmodal= mrOk then
    begin  // Begin If
      DmUsuario.Checar_Filial_Usuario( Trim(FProdutoParam.ME1CodFilial.Text),'ESTOQUE');
      If FRPautaICms = Nil then
        FRPautaICms:=TFRPautaICms.Create(Application);
      With DMPauta_Icms do    // Filtragem dos Dados
        Begin
          QRPauta_Icms.Close;
          If Trim(FProdutoParam.ME22Produto.Text)<>'' then
            QRPauta_Icms.SetVariable('COD_PRODUTO',FProdutoParam.ME22Produto.Text)
          Else
            QRPauta_Icms.SetVariable('COD_PRODUTO',Null);
          If Trim(FProdutoParam.ME22UF.Text)<>'' then
            QRPauta_Icms.SetVariable('COD_ESTADO',FProdutoParam.ME22UF.Text)
          Else
            QRPauta_Icms.SetVariable('COD_ESTADO',Null);
          QRPauta_Icms.Open;
          If FProdutoParam.RGPreview.ItemIndex=0 then
            FRPautaICms.QRPrimario.Preview
          Else
            FRPautaICms.QRPrimario.Print;
          QRPauta_Icms.Close;
        End; //End With
    end;    //End If
end;

end.
