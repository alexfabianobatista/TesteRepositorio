unit URemuneracaoLeitao_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel;

type
  TFRemuneracaoLeitao_Cad = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel9: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRemuneracaoLeitao_Cad: TFRemuneracaoLeitao_Cad;

implementation

uses URemuneracaoLeitao_cl, URemuneracaoLeitao_Cons;

{$R *.dfm}

procedure TFRemuneracaoLeitao_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.Open;
end;

procedure TFRemuneracaoLeitao_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.Close;
end;

procedure TFRemuneracaoLeitao_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRemuneracaoLeitao_Cons = Nil Then
     FRemuneracaoLeitao_Cons := TFRemuneracaoLeitao_Cons.Create(Application);
  If FRemuneracaoLeitao_Cons.ShowModal = MrOk Then
   Begin
     DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.Close;
     DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.SetVariable('Pk',DMRemuneracaoLeitao.QRemuneracaoLeitao_ConsDESC_TIPO_PARCERIA.Value);
     DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.Open;
   End;
end;

end.
