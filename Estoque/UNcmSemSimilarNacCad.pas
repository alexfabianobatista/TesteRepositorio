unit UNcmSemSimilarNacCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, DBCtrls;

type
  TFNcmSemSimilarNacCad = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNcmSemSimilarNacCad: TFNcmSemSimilarNacCad;

implementation

uses UNcm_cl, UNcmSemSimilarNacCons;

{$R *.dfm}

procedure TFNcmSemSimilarNacCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMNcm.QNcmSemSimilarNacCad.Open;
end;

procedure TFNcmSemSimilarNacCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNcmsemSimilarNacCons = nil then
    FNcmSemSimilarNacCons := TFNcmSemSimilarNacCons.Create(Application);
  if FNcmSemSimilarNacCons.ShowModal = mrOk then
  begin
    MELocaliza.Text := DMNcm.QNcmSemSimilarNacConsNUM_NCM.Value;
    MELocalizaExit(Self);
  end;
end;

end.
