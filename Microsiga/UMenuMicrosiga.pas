unit UMenuMicrosiga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuMicrosiga = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    ExportaDados1: TMenuItem;
    ImportaDados1: TMenuItem;
    LiberaPedidos1: TMenuItem;
    ImportaCadastro1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ExportaDados1Click(Sender: TObject);
    procedure ImportaDados1Click(Sender: TObject);
    procedure LiberaPedidos1Click(Sender: TObject);
    procedure ImportaCadastro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuMicrosiga: TFMenuMicrosiga;

implementation

uses UExporta, UImportaMicrosiga, UImporta, ULiberaPedido, UImportaCadastro,
  UTela_cl;

{$R *.DFM}

procedure TFMenuMicrosiga.FormCreate(Sender: TObject);
begin
  inherited;
  pMODULO := 'MICROSIGA';
end;

procedure TFMenuMicrosiga.ExportaDados1Click(Sender: TObject);
begin
  inherited;
  If FExporta = Nil Then
     FExporta := TFExporta.Create(Application);
  DMTela.VerificaTela(pModulo,FExporta.Caption,FExporta.Name);
  FExporta.ShowModal;
end;

procedure TFMenuMicrosiga.ImportaDados1Click(Sender: TObject);
begin
  inherited;
  If FImporta = Nil Then
     FImporta := TFImporta.Create(Application);
  DMTela.VerificaTela(pModulo,FImporta.Caption,FImporta.Name);
  FImporta.ShowModal;
end;

procedure TFMenuMicrosiga.LiberaPedidos1Click(Sender: TObject);
begin
  inherited;
  if FLiberaPedido = nil then
    FLiberaPedido := TFLiberaPedido.create(Application);
  DMTela.VerificaTela(pModulo,FLiberaPedido.Caption,FLiberaPedido.Name);
  FLiberaPedido.showmodal;
end;

procedure TFMenuMicrosiga.ImportaCadastro1Click(Sender: TObject);
begin
  inherited;
  if FimportaCadastro = nil then
    FimportaCadastro := TFimportaCadastro.create(Application);
  DMTela.VerificaTela(pModulo,FimportaCadastro.Caption,FimportaCadastro.Name);
  FimportaCadastro.showmodal;

end;

end.
