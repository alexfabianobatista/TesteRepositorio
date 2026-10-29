unit UDepartamentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, variants,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, ActnList, DBPanel, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFDepartamentoCad = class(TFTCadSimples)
    Departamento1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBRadioGroup2: TDBRadioGroup;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Departamento1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDepartamentoCad: TFDepartamentoCad;

implementation

uses UDepartamento_cl, UDepartamentoCons, URDepartamento_Departamento,
  UMoedaParam;

{$R *.DFM}

procedure TFDepartamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  With DMDepartamento do
  Begin
    QDepartamento.Close;
    QDepartamento.SetVariable('PK',QDepartamentoConsCod_Departamento.Value);
    QDepartamento.Open;
  End;
end;

procedure TFDepartamentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMDepartamento do
    QDepartamento.Open;
end;

procedure TFDepartamentoCad.Departamento1Click(Sender: TObject);
begin
  inherited;
  If FMoedaParam = Nil then
    FMoedaParam := TFMoedaParam.Create(Application);
  FMoedaParam.PGRelatorio.Pages[1].TabVisible := True;
  If FMoedaParam.ShowModal = mrOk then
  Begin
    with DMDepartamento do
    begin
      QRDepartamento.SQL[DMDepartamento.QRDepartamento.SQL.Count-1] := '';
      Case FMoedaParam.Rg1Ordem.ItemIndex of
        0 : QRDepartamento.SQL.Add('ORDER BY Desc_Departamento');
        1 : QRDepartamento.SQL.Add('ORDER BY Cod_Departamento');
      End;
      case FMoedaParam.Rg1Situacao.ItemIndex of
        0: QRDepartamento.SetVariable('IND_SITUACAO','A');
        1: QRDepartamento.SetVariable('IND_SITUACAO','D');
        2: QRDepartamento.SetVariable('IND_SITUACAO',null);
      end;
      QRDepartamento.Open;
      if FRDepartamento_Departamento = Nil then
         FRDepartamento_Departamento := TFRDepartamento_Departamento.Create(Application);
      FRDepartamento_Departamento.QRPrimario.Preview;
      QRDepartamento.Close;
    end;
   End;
end;

procedure TFDepartamentoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(29);
end;

procedure TFDepartamentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMDepartamento do
    QDepartamento.Close;
  Action := CaFree;
  FDepartamentoCad := Nil;
end;

end.
