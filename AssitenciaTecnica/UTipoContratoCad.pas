unit UTipoContratoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFTipoContratoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoContratoCad: TFTipoContratoCad;

implementation

uses UTipoContrato_cl, UTipoContratoCons, URTipoContrato;

{$R *.dfm}

procedure TFTipoContratoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;

  if FTipoContratoCons = Nil then
    FTipoContratoCons := TFTipoContratoCons.Create(Application);
  if FTipoContratoCons.ShowModal = MrOk then
  begin
    with DMTipoContrato do
    begin
      QTipoContrato.Close;
      QTipoContrato.SetVariable('PK', QTipoContratoConsCOD_TIPO_CONTRATO.Value);
      QTipoContrato.Open;
    end;
  end;
end;

procedure TFTipoContratoCad.Relatrios1Click(Sender: TObject);
begin
  inherited;
  DMTipoContrato.QRTipoContrato.Open;

  If FRTipoContrato = Nil Then
    FRTipoContrato := TFRTipoContrato.Create(Application);

  //Cabeçalho
  //--------------------
  FRTipoContrato.QRLTitulo.Caption := 'Relatório de Tipos de Contrato';
  //--------------------
  FRTipoContrato.QRPrimario.Preview;
  DMTipoContrato.QRTipoContrato.Close;
end;

procedure TFTipoContratoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.Dataset := DMTipoContrato.QTipoContrato;
  DSPrimario.DataSet.Open;
end;

end.
