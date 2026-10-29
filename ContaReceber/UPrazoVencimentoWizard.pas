unit UPrazoVencimentoWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, ExtCtrls, DBPanel, Mask, Buttons;

type
  TFPrazoVencimentoWizard = class(TForm)
    PageControlPrazo: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DSPrimario: TDataSource;
    DSDias: TDataSource;
    DBDescricao: TDBPanel;
    ListBox1: TListBox;
    MeParcelas: TMaskEdit;
    Label1: TLabel;
    MeIntervaloDias: TMaskEdit;
    ListBox2: TListBox;
    ListBox3: TListBox;
    BtnAvancar: TBitBtn;
    btnVoltar: TBitBtn;
    Label2: TLabel;
    procedure BtnAvancarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure GerarParcelas(pParcelas : Integer; pDias : Integer);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrazoVencimentoWizard: TFPrazoVencimentoWizard;

implementation

uses
  UPrazoVencimento_cl;

{$R *.dfm}

procedure TFPrazoVencimentoWizard.BtnAvancarClick(Sender: TObject);
begin
  if(PageControlPrazo.ActivePageIndex = 0)then
  begin
    PageControlPrazo.Pages[PageControlPrazo.ActivePageIndex+1].TabVisible := true;
    PageControlPrazo.ActivePage.TabVisible := false;
  end
  else
  if(PageControlPrazo.ActivePageIndex = 1)then
  begin
    GerarParcelas(StrToInt(Trim(MeParcelas.Text)), StrToInt(Trim(MeIntervaloDias.Text)));
    Close;
  end;
end;

procedure TFPrazoVencimentoWizard.FormActivate(Sender: TObject);
var
  i : Integer;
begin
  i := 0;
  while (i < PageControlPrazo.PageCount) do
  begin
    if i > 0 then
      PageControlPrazo.Pages[i].TabVisible := false
    else
      PageControlPrazo.Pages[i].TabVisible := true;    
    Inc(i);
  end;
end;

procedure TFPrazoVencimentoWizard.btnVoltarClick(Sender: TObject);
begin
  if(PageControlPrazo.ActivePageIndex = 1)then
  begin
    PageControlPrazo.Pages[PageControlPrazo.ActivePageIndex-1].TabVisible := true;
    PageControlPrazo.ActivePage.TabVisible := false;
  end
end;

procedure TFPrazoVencimentoWizard.GerarParcelas(pParcelas : Integer; pDias : Integer);
var
  wCont : Integer;
begin
  wCont := 1;
  while ( wCont <= pParcelas ) do
  begin
    with DMPrazoVencimento do
    begin
      try
        QDias.Insert;
        QDiasNUM_DIAS.Value := wCont * pDias;
        QDiasPERC_JURO.Value := 0;
        QDias.Post;
      except on e: Exception do
        raise Exception.Create(e.Message);
      end;
    end;
    Inc(wCont);
  end;
end;


procedure TFPrazoVencimentoWizard.TabSheet1Show(Sender: TObject);
begin
  DBDescricao.SetFocus;
end;

procedure TFPrazoVencimentoWizard.TabSheet2Show(Sender: TObject);
begin
  MeParcelas.SetFocus;
end;

end.
