unit UIncentivo_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, DBPanel, ActnList, ImgList, DB, Menus, ComCtrls,
  StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFIncentivo_Cad = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIncentivo_Cad: TFIncentivo_Cad;

implementation

uses UIncentivo_cl, UCadastroCons, UIncentivo_Cons;

{$R *.dfm}

procedure TFIncentivo_Cad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  formconsulta := @FcadastroCons;
  Classe := TfCadastroCons;
end;

procedure TFIncentivo_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMIncentivo.QIncentivo_Cad.Open;
end;

procedure TFIncentivo_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMIncentivo.QIncentivo_Cad.Close;
end;

procedure TFIncentivo_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FIncentivo_Cons = Nil Then
     FIncentivo_Cons := TFIncentivo_Cons.Create(Application);
  If FIncentivo_Cons.ShowModal = MrOk Then
   Begin
     DMIncentivo.QIncentivo_Cad.Close;
     DMIncentivo.QIncentivo_Cad.SetVariable('Pk',DMIncentivo.QIncentivo_ConsCod_Incentivo.Value);
     DMIncentivo.QIncentivo_Cad.Open;
   End;
end;

end.
