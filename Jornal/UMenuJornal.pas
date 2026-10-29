unit UMenuJornal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, ImgList, ComCtrls, Buttons, ExtCtrls;

type
  TFMenuJornal = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Contrato1: TMenuItem;
    ControledeRecebimento1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Contrato1Click(Sender: TObject);
    procedure ControledeRecebimento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuJornal: TFMenuJornal;

implementation

uses UContratoJornalCad, URecebimento, UTela_cl;

{$R *.dfm}

procedure TFMenuJornal.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'JORNAL';
end;

procedure TFMenuJornal.Contrato1Click(Sender: TObject);
begin
  inherited;
  if FContratoJornalCad = nil then
    FContratoJornalCad := TFContratoJornalCad.Create(Application);
  DMTela.VerificaTela(pModulo, FContratoJornalCad.Caption, FContratoJornalCad.Name);
  FContratoJornalCad.ShowModal;
end;

procedure TFMenuJornal.ControledeRecebimento1Click(Sender: TObject);
begin
  inherited;
  if FRecebimento = Nil then
    FRecebimento := TFRecebimento.Create(Application);
  DMTela.VerificaTela(pModulo, FRecebimento.Caption, FRecebimento.Name);
  FRecebimento.ShowModal;
end;

end.
