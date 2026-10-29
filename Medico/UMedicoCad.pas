unit UMedicoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls;

type
  TFMedicoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
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
  FMedicoCad: TFMedicoCad;

implementation

uses UMedico_cl, MaskUtils, UMedicoCons, URMedico;

{$R *.dfm}

procedure TFMedicoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet := DMMedico.QMedico;
end;

procedure TFMedicoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
end;

procedure TFMedicoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMedicoCons = Nil then
    FMedicoCons := TFMedicoCons.Create(Application);
  if FMedicoCons.ShowModal = MrOk then
  begin
    //Atribui a Query de Cadastro o Codigo retornado da consulta
    MELocaliza.Text := DMMedico.QMedicoConsCOD_MEDICO.Text;
    MELocalizaExit(self);
  end;
end;

procedure TFMedicoCad.Relatrios1Click(Sender: TObject);
begin
  inherited;
  with DMMedico do
  begin
    //Geração do Relatório
    QRMedico.Close;
    QRMedico.Open;

    if FRMedico = Nil then
      FRMedico := TFRMedico.Create(Application);

    //Mostra o Relatório
    FRMedico.QRPrimario.Preview;
    //----------------------
  end;
end;

end.
