unit UConvenioCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls;

type
  TFConvenioCad = class(TFTCadSimples)
    Bevel1: TBevel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConvenioCad: TFConvenioCad;

implementation

uses UConvenio_cl, UConvenioCons, URConvenio;

{$R *.dfm}

procedure TFConvenioCad.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet := DMConvenio.QConvenio;
end;

procedure TFConvenioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
end;

procedure TFConvenioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FConvenioCons = Nil then
    FConvenioCons := TFConvenioCons.Create(Application);
  if FConvenioCons.ShowModal = MrOk then
  begin
    //Atribui a Query de Cadastro o Codigo retornado da consulta
    MELocaliza.Text := DMConvenio.QConvenioConsCOD_CONVENIO.Text;
    MELocalizaExit(self);
  end;
end;

procedure TFConvenioCad.Relatrios1Click(Sender: TObject);
begin
  inherited;
  with DMConvenio do
  begin
    //Geração do Relatório
    QRConvenio.Close;
    QRConvenio.Open;

    if FRConvenio = Nil then
      FRConvenio := TFRConvenio.Create(Application);

    //Mostra o Relatório
    FRConvenio.QRPrimario.Preview;
    //----------------------
  end;
end;

end.
