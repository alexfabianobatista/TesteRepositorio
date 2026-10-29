unit UVerbaRepresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu;

type
  TFVerbaRepresentante = class(TFTCadSimples)
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
    SbSupervisor: TSpeedButton;
    DBDirceu1: TDBDirceu;
    RelVerbaRepresentante1: TMenuItem;
    procedure SbSupervisorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RelVerbaRepresentante1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVerbaRepresentante: TFVerbaRepresentante;

implementation

uses UVerbaRepresentante_cl, UVendedorCons, UVendedor_cl,
  UVerbaRepresentanteParam, URVerbaRepresentante, UVerbaRepresentanteCons;

{$R *.dfm}

procedure TFVerbaRepresentante.SbSupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal=mrOk then
    DMVerbaRepresentante.QVerbaRepresentante_CadCod_Vendedor.Value:=DMVendedor.QVendedorConsCod_Vendedor.Value;

end;

procedure TFVerbaRepresentante.FormActivate(Sender: TObject);
begin
  inherited;
  DMVerbaRepresentante.QVerbaRepresentante_Cad.open;
end;

procedure TFVerbaRepresentante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMVerbaRepresentante.QVerbaRepresentante_Cad.Close;
end;

procedure TFVerbaRepresentante.RelVerbaRepresentante1Click(
  Sender: TObject);
begin
  inherited;
  if FVerbaRepresentanteParam = Nil then
    FVerbaRepresentanteParam := TFVerbaRepresentanteParam.Create(Application);
  FVerbaRepresentanteParam.PGRelatorio.Pages[0].Tabvisible := true;
  if FVerbaRepresentanteParam.ShowModal = MrOK then
  begin
    with DMVerbaRepresentante do
    begin
      QRVerbaRepresentante.Close;

      if Trim(FVerbaRepresentanteParam.Me1Representante.Text) <> '' then
        QRVerbaRepresentante.SetVariable('VENDEDOR', Trim(FVerbaRepresentanteParam.Me1Representante.Text))
      else
        QRVerbaRepresentante.SetVariable('VENDEDOR', Null);

        QRVerbaRepresentante.SetVariable('MES', Trim(FVerbaRepresentanteParam.Me1Mes.Text));
        QRVerbaRepresentante.SetVariable('ANO', Trim(FVerbaRepresentanteParam.Me1Ano.Text));
        FRVerbaRepresentante.QRLMes.Caption := Trim(FVErbaRepresentanteParam.Me1Mes.Text);
        FRVerbaRepresentante.QRLAno.Caption := Trim(FVErbaRepresentanteParam.Me1Ano.Text);

      QRVerbaRepresentante.Open;

      if FRVerbaRepresentante = Nil then
        FRVerbaRepresentante := TFRVerbaRepresentante.Create(Application);
      if FVerbaRepresentanteParam.RGPreview.ItemIndex = 0 then
        FRVerbaRepresentante.QRPrimario.Preview
      else
        FRVerbaRepresentante.QRPrimario.Print;
    end;
  end;
end;

procedure TFVerbaRepresentante.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FVerbaRepresentanteCons = Nil Then
     FVerbaRepresentanteCons := TFVerbaRepresentanteCons.Create(Application);
  If FVerbaRepresentanteCons.ShowModal = MrOk Then
   Begin
     DMVerbaRepresentante.QVerbaRepresentante_Cad.Close;
     DMVerbaRepresentante.QVerbaRepresentante_Cad.SetVariable('pk',DMVerbaRepresentante.QVerbaRepresentanteConsCod_Verba_Representante.Value);
     DMVerbaRepresentante.QVerbaRepresentante_Cad.Open;
   End;
end;

end.
