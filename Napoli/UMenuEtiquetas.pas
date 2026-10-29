unit UMenuEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ExtCtrls, Buttons, ImgList, ComCtrls,
  UTMenuPrincipal;

type
  TFMenuEtiquetas = class(TFTMenuPrincipal)
  //TFMenuEtiquetas = class(TForm)
    Manuteno1: TMenuItem;
    EtiquetasNapoli: TMenuItem;
    EtiquetasCasinha: TMenuItem;
    EtiquetasOsare: TMenuItem;
    EtiquetaCarto1: TMenuItem;
    EtiquetaDisamMquinas1: TMenuItem;
    Etiqueta3x61: TMenuItem;
    procedure EtiquetasCasinhaClick(Sender: TObject);
    procedure EtiquetasOsareClick(Sender: TObject);
    procedure EtiquetasNapoliClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EtiquetaCarto1Click(Sender: TObject);
    procedure EtiquetaDisamMquinas1Click(Sender: TObject);
    procedure Etiqueta3x61Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuEtiquetas: TFMenuEtiquetas;

implementation

uses UEmissaoEtiquetas, UEmissaoEtiquetas2,UEmissaoEtiquetasOsare,
  UTela_cl, UEtiquetaCodCartao, UEmissaoEtiquetaStara, UFEtiqueta3X6Neusa;

{$R *.DFM}

procedure TFMenuEtiquetas.EtiquetasNapoliClick(Sender: TObject);
begin
  inherited;
  If FEmissaoEtiquetas = Nil then
    FEmissaoEtiquetas := TFEmissaoEtiquetas.Create(Application);
  //DMTela.VerificaTela(pModulo,FEmissaoEtiquetas.Caption,FEmissaoEtiquetas.Name);
  FEmissaoEtiquetas.ShowModal;
end;

procedure TFMenuEtiquetas.EtiquetasCasinhaClick(Sender: TObject);
begin
  inherited;
  If FEmissaoEtiquetas2 = Nil then
     FEmissaoEtiquetas2 := TFEmissaoEtiquetas2.Create(Application);
  //DMTela.VerificaTela(pModulo,FEmissaoEtiquetas2.Caption,FEmissaoEtiquetas2.Name);
  FEmissaoEtiquetas2.ShowModal;
end;

procedure TFMenuEtiquetas.EtiquetasOsareClick(Sender: TObject);
begin
  inherited;
  If FEmissaoEtiquetasOsare = Nil then
    FEmissaoEtiquetasOsare := TFEmissaoEtiquetasOsare.Create(Application);
  DMTela.VerificaTela(pModulo,FEmissaoEtiquetasOsare.Caption,FEmissaoEtiquetasOsare.Name);
  FEmissaoEtiquetasOsare.ShowModal;
end;

procedure TFMenuEtiquetas.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo:='ETIQUETA';
end;

procedure TFMenuEtiquetas.EtiquetaCarto1Click(Sender: TObject);
begin
  inherited;
  if FEtiquetaCodCartao = nil then
    FEtiquetaCodCartao := TFEtiquetaCodCartao.Create(Application);
  FEtiquetaCodCartao.ShowModal;
end;

procedure TFMenuEtiquetas.EtiquetaDisamMquinas1Click(Sender: TObject);
begin
  inherited;
  if FEmissaoEtiquetaStara = nil then //DISAM MÁQUINAS
    FEmissaoEtiquetaStara := TFEmissaoEtiquetaStara.Create(Application);
  FEmissaoEtiquetaStara.ShowModal;
end;

procedure TFMenuEtiquetas.Etiqueta3x61Click(Sender: TObject);
begin
  inherited;
  if FEtiqueta3X6Neusa = nil then
    FEtiqueta3X6Neusa := TFEtiqueta3X6Neusa.Create(Application);
  FEtiqueta3X6Neusa.ShowModal;
end;

end.
