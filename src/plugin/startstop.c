/* SPDX-License-Identifier: LGPL-3.0-or-later */

/*
 * Copyright (C) 2021 Perry Werneck <perry.werneck@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

 #include <lib3270.h>
 #include <v3270/dialogs.h>
 #include <stdio.h>
 #include <string.h>
 #include <gtk/gtk.h>

#ifdef _WIN32
	#include <windows.h>
	#include <fileapi.h>
#endif // _WIN32



#define NUM_MAX_CERTIFICADOS 3
#define NUM_MAX_USUARIOS 3

char *funcionario[8];

int num_valid_users = 0;
int revalidate = 0;

char * valid_users[NUM_MAX_CERTIFICADOS];
char usuario_logado[8] = "";

static const gchar * versao         = "5.1.3.9";
static GtkWidget * rotulo                     = NULL;
static GtkWidget * detalhe_do_rotulo              = NULL;
static GtkWidget * botao_de_validar               = NULL;
static GtkWidget * progress_bar              = NULL;

 /// @brief A new window was created, watch it
 LIB3270_EXPORT void pw3270_plugin_window_added(GtkWidget *window) {

	// Monitor de smart-card é para ser um singleton posto que apenas uma instância deve ser suficiente.
	static uint8_t initialized = 0;

	g_message("New window added");

	if(!initialized) {

		g_message("Inicializando monitor de smart-card");
		// Aplicação não foi inicializada, inicia.
		initialized = 1;

		GtkWidget * dialog =
			gtk_message_dialog_new(
				GTK_WINDOW(gtk_widget_get_toplevel(window)),
				GTK_DIALOG_MODAL|GTK_DIALOG_DESTROY_WITH_PARENT,
				GTK_MESSAGE_QUESTION,
				GTK_BUTTONS_NONE,
				"Insira o certificado digital na leitora, clique em validar e aguarde a confirmação do PIN"
			);


		gtk_window_set_deletable(GTK_WINDOW(dialog),FALSE);
		gtk_window_set_resizable(GTK_WINDOW(dialog),FALSE);

		gtk_dialog_add_buttons(
			GTK_DIALOG(dialog),
			"Validar",	GTK_RESPONSE_APPLY,
			"Cancelar",	GTK_RESPONSE_CANCEL,
			NULL
		);

		gtk_widget_show_all(dialog);
		gint response = gtk_dialog_run(GTK_DIALOG(dialog));
		gtk_widget_destroy(dialog);


	}


	/*
	 pw3270_application_set_log_filename(application,"log_pw3270");

	g_message("nova janela criada.");
	g_message("inicianto a validacao do SmartCard.");

	smartcard_prepara_validacao(funcionario);
	*/

 }

 /*
 void smartcard_prepara_validacao(char *funcionario)
 {
	g_message("smartcard_prepara_validacao(): PW3270 - Emulador 3270, versão CAIXA %s", versao);
    g_message("smartcard_prepara_validacao(): Iniciando processo de verificação do Certificado Digital");

	valid_users[0] = (char *) calloc (8, sizeof(char));
    valid_users[1] = (char *) calloc (8, sizeof(char));
    valid_users[2] = (char *) calloc (8, sizeof(char));

	g_message("smartcard_prepara_validacao(): Iniciando o janela de login");

	smartcard_plugin_app = gtk_application_new("org.gtk.activate", G_APPLICATION_FLAGS_NONE);
	g_signal_connect(smartcard_plugin_app, "activate", G_CALLBACK(ativacao),NULL);
	g_application_run(G_APPLICATION(smartcard_plugin_app),0,NULL);
	g_object_unref(smartcard_plugin_app);
 }

 static void ativacao(GtkApplication* app, gpointer user_data)
 {
	char titulo[40];
    int certutil_exist = access("C:\\Windows\\system32\\certutil.exe", 0);
    sprintf(titulo, "RedeCaixaSimplificado - PW3270 %s", versao);

	GtkWidget * window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), titulo);
    gtk_window_set_default_size (GTK_WINDOW (window), 800, 350);
    gtk_window_set_position (GTK_WINDOW (window), GTK_WIN_POS_CENTER);
    gtk_window_set_resizable (GTK_WINDOW (window), FALSE);

	GtkWidget * grid = gtk_grid_new ();
    gtk_grid_set_row_homogeneous (GTK_GRID (grid), FALSE);
    gtk_grid_set_row_spacing (GTK_GRID (grid), 15);
    gtk_container_add (GTK_CONTAINER (window), grid);

	progress_bar = gtk_progress_bar_new ();
    gtk_progress_bar_set_fraction (GTK_PROGRESS_BAR (progress_bar), 0.0);
    gtk_widget_set_vexpand (progress_bar, TRUE);
    gtk_widget_set_hexpand (progress_bar, TRUE);

    rotulo = gtk_label_new ("Insira o certificado digital na leitora, clique em validar e aguarde a confirmação do PIN");
    gtk_label_set_justify(GTK_LABEL(rotulo), GTK_JUSTIFY_CENTER);
    gtk_widget_set_vexpand (rotulo, TRUE);
    gtk_widget_set_hexpand (rotulo, TRUE);

    detalhe_do_rotulo = gtk_label_new ("");
    gtk_label_set_justify(GTK_LABEL(detalhe_do_rotulo), GTK_JUSTIFY_CENTER);
    gtk_widget_set_hexpand (detalhe_do_rotulo, TRUE);
    gtk_widget_set_vexpand (detalhe_do_rotulo, TRUE);

    botao_de_validar = gtk_button_new_with_label("Validar");

    gtk_grid_attach (GTK_GRID (grid), progress_bar, 0, 0, 3, 1);
    gtk_grid_attach (GTK_GRID (grid), rotulo, 0, 1, 3, 1);
    gtk_grid_attach (GTK_GRID (grid), detalhe_do_rotulo, 0, 2, 3, 1);
    gtk_grid_attach (GTK_GRID (grid), botao_de_validar, 0, 3, 3, 1);

	gtk_widget_grab_focus (botao_de_validar);
	gtk_widget_show_all(window);
 }
*/

